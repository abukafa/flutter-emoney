class TopupModel {
  final String amount;
  final String pin;
  final String paymentMethodCode;

  TopupModel({
    required this.amount,
    required this.pin,
    required this.paymentMethodCode,
  });

  TopupModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) {
    return TopupModel(
      amount: amount ?? this.amount,
      pin: pin ?? this.pin,
      paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'pin': pin,
      'payment_method_code': paymentMethodCode,
    };
  }
}
