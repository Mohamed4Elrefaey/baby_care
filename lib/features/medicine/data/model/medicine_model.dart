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
  @HiveField(9)
  final Map<String, dynamic> extraFields;

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
    this.extraFields = const {},
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {
      '_id',
      'name',
      'description',
      'details',
      'form',
      'category',
      'usage',
      'sideEffects',
      'imageUrl',
    };
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return MedicineModel(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      details: json['details'] as String? ?? '',
      form: json['form'] as String? ?? '',
      category: json['category'] as String? ?? '',
      usage: json['usage'] as String? ?? '',
      sideEffects: json['sideEffects'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'details': details,
      'form': form,
      'category': category,
      'usage': usage,
      'sideEffects': sideEffects,
      'imageUrl': imageUrl,
      ...extraFields,
    };
  }
}
