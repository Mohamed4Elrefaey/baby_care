import 'package:hive/hive.dart';

part 'health_unit_model.g.dart';

@HiveType(typeId: 16)
class HealthUnitModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String governorate;
  @HiveField(3)
  final String city;
  @HiveField(4)
  final Map<String, dynamic> extraFields;

  HealthUnitModel({
    required this.id,
    required this.name,
    required this.governorate,
    required this.city,
    this.extraFields = const {},
  });

  factory HealthUnitModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {'_id', 'name', 'governorate', 'city'};
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return HealthUnitModel(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      governorate: json['governorate'] as String? ?? '',
      city: json['city'] as String? ?? '',
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'governorate': governorate,
      'city': city,
      ...extraFields,
    };
  }
}
