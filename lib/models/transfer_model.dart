class TransferModel {
  final String amount;
  final String pin;
  final String sendTo;

  TransferModel({
    required this.amount,
    required this.pin,
    required this.sendTo,
  });

  TransferModel copyWith({String? amount, String? pin, String? sendTo}) {
    return TransferModel(
      amount: amount ?? this.amount,
      pin: pin ?? this.pin,
      sendTo: sendTo ?? this.sendTo,
    );
  }

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'pin': pin, 'send_to': sendTo};
  }
}
