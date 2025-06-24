class PaymentMethodModel {
  final int? id;
  final String name;
  final String code;
  final String thumbnail;

  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.code,
    required this.thumbnail,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      code: json['code'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }
}
