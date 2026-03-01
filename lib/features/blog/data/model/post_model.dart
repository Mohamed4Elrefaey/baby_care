import 'package:hive/hive.dart';

part 'post_model.g.dart';

@HiveType(typeId: 14)
class PostModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String? imageUrl;
  @HiveField(4)
  final int? likes;
  @HiveField(5)
  final int? commentsCount;
  @HiveField(6)
  final Map<String, dynamic> extraFields;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    this.likes,
    this.commentsCount,
    this.extraFields = const {},
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {'_id', 'title', 'content', 'imageUrl', 'likes', 'commentsCount'};
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return PostModel(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      likes: json['likes'] as int?,
      commentsCount: json['commentsCount'] as int?,
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'likes': likes,
      'commentsCount': commentsCount,
      ...extraFields,
    };
  }
}
