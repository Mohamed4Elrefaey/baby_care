import 'package:hive_flutter/hive_flutter.dart';
part 'vaccine_record_model.g.dart';

@HiveType(typeId: 3)
class VaccineRecordModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String vaccineName;
  @HiveField(2)
  final DateTime dueDate;
  @HiveField(3)
  String status;
  @HiveField(4)
  String? notes;
  @HiveField(6)
  String? dateAdministered;

  VaccineRecordModel({
    required this.id,
    required this.dueDate,
    required this.status,
    this.notes,
    this.dateAdministered,
    required this.vaccineName,
  });

  factory VaccineRecordModel.fromJson(Map<String, dynamic> json) {
    return VaccineRecordModel(
      id: json['id'].toString(),
      dueDate: DateTime.parse(json['dueDate']),
      status: json['status'],
      dateAdministered: json['dateAdministered'],
      notes: json['notes'],
      vaccineName: json['vaccineName'],
    );
  }
}
