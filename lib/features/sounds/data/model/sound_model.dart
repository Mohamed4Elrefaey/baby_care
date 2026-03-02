import 'package:hive/hive.dart';
part 'sound_model.g.dart';

@HiveType(typeId: 8)
class SoundModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String audioUrl;
  @HiveField(5)
  final String imageUrl;
  @HiveField(6)
  final Map<String, dynamic> extraFields;

  SoundModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.audioUrl,
    required this.imageUrl,
    this.extraFields = const {},
  });

  factory SoundModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {
      '_id',
      'title',
      'description',
      'category',
      'audioUrl',
      'imageUrl',
    };
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return SoundModel(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? '',
      audioUrl: json['audioUrl'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'category': category,
      'audioUrl': audioUrl,
      'imageUrl': imageUrl,
      ...extraFields,
    };
  }
}
