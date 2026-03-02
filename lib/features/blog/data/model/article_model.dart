import 'package:hive/hive.dart';
part 'article_model.g.dart';

@HiveType(typeId: 7)
class ArticleModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String imageUrl;
  @HiveField(5)
  final String description;

  ArticleModel({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.imageUrl,
    required this.description,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'].toString(),
      title: json['title'],
      content: json['content'],
      category: json['category'],
      imageUrl: json['imageUrl'],

      description: json['description'],
    );
  }
}
