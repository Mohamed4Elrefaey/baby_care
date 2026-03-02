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

  SoundModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.audioUrl,
    required this.imageUrl,
  });

  factory SoundModel.fromJson(Map<String, dynamic> json) {
    return SoundModel(
      id: json['id'].toString(),
      title: json['title'],
      description: json['description'],
      category: json['category'],
      audioUrl: json['audioUrl'],
      imageUrl: json['imageUrl'],
    );
  }
}
