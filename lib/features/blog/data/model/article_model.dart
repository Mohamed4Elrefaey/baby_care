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
  final String author;
  @HiveField(6)
  final DateTime? createdAt;
  @HiveField(7)
  final DateTime? updatedAt;
  @HiveField(8)
  final String description;
  @HiveField(9)
  final Map<String, dynamic> extraFields;

  ArticleModel({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.imageUrl,
    required this.author,
    this.createdAt,
    this.updatedAt,
    required this.description,
    this.extraFields = const {},
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {
      '_id',
      'title',
      'content',
      'category',
      'imageUrl',
      'author',
      'createdAt',
      'updatedAt',
      'description',
    };
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return ArticleModel(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      category: json['category'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      author: json['author'] is Map ? (json['author']['name'] ?? '') : (json['author']?.toString() ?? ''),
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      description: json['description'] as String? ?? '',
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'content': content,
      'category': category,
      'imageUrl': imageUrl,
      'author': author,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'description': description,
      ...extraFields,
    };
  }
}
