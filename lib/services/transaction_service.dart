import 'dart:convert';

import 'package:flutter_emoney/models/data_plan_form_model.dart';
import 'package:flutter_emoney/models/topup_model.dart';
import 'package:flutter_emoney/models/transaction_model.dart';
import 'package:flutter_emoney/models/transfer_model.dart';
import 'package:flutter_emoney/services/auth_service.dart';
import 'package:flutter_emoney/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topUp(TopupModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/top_ups'),
        headers: {'Authorization': token},
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TransferModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/transfers'),
        headers: {'Authorization': token},
        body: data.toJson(),
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> dataPlan(DataPlanFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/data_plans'),
        headers: {'Authorization': token},
        body: data.toJson(),
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransactions() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/transactions?limit=5'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        return List<TransactionModel>.from(
          jsonDecode(res.body)['data'].map(
            (transaction) => TransactionModel.fromJson(transaction),
          ),
        ).toList();
      }

      // Cek jika response body bisa di-decode
      try {
        final body = jsonDecode(res.body);
        throw body['message'] ?? 'Failed to load transactions';
      } catch (_) {
        throw 'Failed to load transactions (${res.statusCode})';
      }
    } catch (e) {
      rethrow;
    }
  }
}
