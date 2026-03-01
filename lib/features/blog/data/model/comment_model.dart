import 'package:hive/hive.dart';

part 'comment_model.g.dart';

@HiveType(typeId: 15)
class CommentModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String authorName;
  @HiveField(3)
  final DateTime? createdAt;
  @HiveField(4)
  final Map<String, dynamic> extraFields;

  CommentModel({
    required this.id,
    required this.content,
    required this.authorName,
    this.createdAt,
    this.extraFields = const {},
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {'_id', 'content', 'authorName', 'createdAt'};
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return CommentModel(
      id: json['_id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      authorName: json['author'] is Map ? (json['author']['name'] ?? '') : (json['author']?.toString() ?? ''),
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'content': content,
      'authorName': authorName,
      'createdAt': createdAt?.toIso8601String(),
      ...extraFields,
    };
  }
}
