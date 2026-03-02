import 'package:hive_flutter/hive_flutter.dart';

part 'vaccine_model.g.dart';

@HiveType(typeId: 2)
class VaccineModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final Map<String, dynamic> extraFields;

  VaccineModel({
    required this.id,
    required this.name,
    this.description,
    this.extraFields = const {},
  });

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {'_id', 'name', 'description'};
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return VaccineModel(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      ...extraFields,
    };
  }
}
