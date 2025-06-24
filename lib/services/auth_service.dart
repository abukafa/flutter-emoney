import 'dart:convert';

import 'package:flutter_emoney/models/signin_model.dart';
import 'package:flutter_emoney/models/signup_model.dart';
import 'package:flutter_emoney/models/user_model.dart';
import 'package:flutter_emoney/shared/shared_values.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/is-email-exist'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        // return jsonDecode(res.body)['errors'];
        throw jsonDecode(res.body)['message'] ?? 'Unknown error checking email';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/register'),
        body: data.toJson(),
      );

      print(res.body);

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SigninModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.toJson(),
      );

      print(res.body);

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final token = await getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {'Authorization': token},
      );
      if (res.statusCode == 200) {
        await clearLocaleStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SigninModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['email'] == null || values['password'] == null) {
        throw 'authenticated';
      } else {
        final SigninModel data = SigninModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = 'Bearer $value';
    }
    return token;
  }

  Future<void> clearLocaleStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
