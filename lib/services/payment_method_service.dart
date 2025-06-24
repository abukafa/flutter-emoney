import 'dart:convert';

import 'package:flutter_emoney/models/payment_method_model.dart';
import 'package:flutter_emoney/services/auth_service.dart';
import 'package:flutter_emoney/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/payment_methods'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(
          jsonDecode(res.body).map((json) => PaymentMethodModel.fromJson(json)),
        ).toList();
      } else {
        throw jsonDecode(res.body)['message'] ??
            'Unknown error fetching payment methods';
      }
    } catch (e) {
      rethrow;
    }
  }
}
