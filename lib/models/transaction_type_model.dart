class TransactionTypeModel {
  final int? id;
  final String? name;
  final String? code;
  final String? action;
  final String? thumbnail;

  TransactionTypeModel({
    required this.id,
    required this.name,
    required this.code,
    required this.action,
    required this.thumbnail,
  });

  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) {
    return TransactionTypeModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      action: json['action'],
      thumbnail: json['thumbnail'],
    );
  }
}
