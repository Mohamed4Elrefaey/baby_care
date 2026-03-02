import 'package:hive_flutter/hive_flutter.dart';
part 'child_model.g.dart';

@HiveType(typeId: 1)
class ChildModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String gender;
  @HiveField(3)
  final DateTime? dateOfBirth;
  @HiveField(4)
  final Map<String, dynamic> extraFields;

  ChildModel({
    required this.id,
    required this.name,
    required this.gender,
    this.dateOfBirth,
    this.extraFields = const {},
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {'_id', 'name', 'gender', 'dateOfBirth'};
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return ChildModel(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.tryParse(json['dateOfBirth'] as String) : null,
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'gender': gender,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      ...extraFields,
    };
  }
}
