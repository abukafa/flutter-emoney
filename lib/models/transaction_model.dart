import 'package:flutter_emoney/models/payment_method_model.dart';
import 'package:flutter_emoney/models/transaction_type_model.dart';

class TransactionModel {
  final int? id;
  final int? amount;
  final DateTime? createAt;
  final PaymentMethodModel paymentMethod;
  final TransactionTypeModel transactionType;

  TransactionModel({
    this.id,
    this.amount,
    this.createAt,
    required this.paymentMethod,
    required this.transactionType,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        amount: json['amount'],
        createAt: DateTime.tryParse(json['created_at']),
        paymentMethod: json['payment_method'] == null
            ? throw Exception('payment_method is required')
            : PaymentMethodModel.fromJson(json['payment_method']),
        transactionType: json['transaction_type'] == null
            ? throw Exception('transaction_type is required')
            : TransactionTypeModel.fromJson(json['transaction_type']),
      );
}
