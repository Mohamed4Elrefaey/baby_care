import 'package:baby_care/features/vaccination/data/model/vaccine_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'vaccine_record_model.g.dart';

@HiveType(typeId: 3)
class VaccineRecordModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String childId;
  @HiveField(2)
  final VaccineModel vaccine;
  @HiveField(3)
  final DateTime? dueDate;
  @HiveField(4)
  String status;
  @HiveField(5)
  String? notes;
  @HiveField(6)
  String? dateAdministered;
  @HiveField(7)
  final Map<String, dynamic> extraFields;

  VaccineRecordModel({
    required this.id,
    required this.childId,
    required this.vaccine,
    this.dueDate,
    required this.status,
    this.notes,
    this.dateAdministered,
    this.extraFields = const {},
  });

  factory VaccineRecordModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {
      '_id',
      'child',
      'vaccine',
      'dueDate',
      'status',
      'dateAdministered',
      'notes',
    };
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return VaccineRecordModel(
      id: json['_id'] as String? ?? '',
      childId: json['child'] as String? ?? '',
      vaccine: VaccineModel.fromJson(json['vaccine'] ?? {}),
      dueDate: json['dueDate'] != null ? DateTime.tryParse(json['dueDate']) : null,
      status: json['status'] as String? ?? '',
      dateAdministered: json['dateAdministered'] as String?,
      notes: json['notes'] as String?,
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'child': childId,
      'vaccine': vaccine.toJson(),
      'dueDate': dueDate?.toIso8601String(),
      'status': status,
      'dateAdministered': dateAdministered,
      'notes': notes,
      ...extraFields,
    };
  }
}
