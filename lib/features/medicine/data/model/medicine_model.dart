import 'package:hive/hive.dart';
part 'medicine_model.g.dart';

@HiveType(typeId: 9)
class MedicineModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String details;
  @HiveField(4)
  final String form;
  @HiveField(5)
  final String category;
  @HiveField(6)
  final String usage;
  @HiveField(7)
  final String sideEffects;
  @HiveField(8)
  final String imageUrl;

  MedicineModel({
    required this.id,
    required this.name,
    required this.description,
    required this.details,
    required this.form,
    required this.category,
    required this.usage,
    required this.sideEffects,
    required this.imageUrl,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'],
      details: json['details'],
      form: json['form'],
      category: json['category'],
      usage: json['usage'],
      sideEffects: json['sideEffects'],
      imageUrl: json['imageUrl'],
    );
  }
}
