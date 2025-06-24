class TipModel {
  final int id;
  final String title;
  final String url;
  final String thumbnail;

  TipModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnail,
  });

  factory TipModel.fromJson(Map<String, dynamic> json) {
    return TipModel(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }
}
