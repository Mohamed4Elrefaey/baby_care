import 'package:hive/hive.dart';

part 'growth_record_model.g.dart';

@HiveType(typeId: 13)
class GrowthRecordModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String childId;
  @HiveField(2)
  final double weight;
  @HiveField(3)
  final double height;
  @HiveField(4)
  final double? headCircumference;
  @HiveField(5)
  final DateTime? dateOfMeasurement;
  @HiveField(6)
  final String? notes;
  @HiveField(7)
  final Map<String, dynamic> extraFields;

  GrowthRecordModel({
    required this.id,
    required this.childId,
    required this.weight,
    required this.height,
    this.headCircumference,
    this.dateOfMeasurement,
    this.notes,
    this.extraFields = const {},
  });

  factory GrowthRecordModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {
      '_id',
      'childId',
      'weight',
      'height',
      'headCircumference',
      'dateOfMeasurement',
      'notes',
    };
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return GrowthRecordModel(
      id: json['_id'] as String? ?? '',
      childId: json['childId'] as String? ?? '',
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      headCircumference: (json['headCircumference'] as num?)?.toDouble(),
      dateOfMeasurement: json['dateOfMeasurement'] != null ? DateTime.tryParse(json['dateOfMeasurement']) : null,
      notes: json['notes'] as String?,
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'childId': childId,
      'weight': weight,
      'height': height,
      'headCircumference': headCircumference,
      'dateOfMeasurement': dateOfMeasurement?.toIso8601String(),
      'notes': notes,
      ...extraFields,
    };
  }
}
