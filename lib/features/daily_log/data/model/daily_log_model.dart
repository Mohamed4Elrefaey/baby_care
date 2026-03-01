import 'package:hive/hive.dart';

part 'daily_log_model.g.dart';

@HiveType(typeId: 11)
class DailyLogModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String childId;
  @HiveField(2)
  final String logType;
  @HiveField(3)
  final DateTime? startTime;
  @HiveField(4)
  final DateTime? endTime;
  @HiveField(5)
  final String? notes;
  @HiveField(6)
  final double? quantity;
  @HiveField(7)
  final String? unit;
  @HiveField(8)
  final String? diaperType;
  @HiveField(9)
  final Map<String, dynamic> extraFields;

  DailyLogModel({
    required this.id,
    required this.childId,
    required this.logType,
    this.startTime,
    this.endTime,
    this.notes,
    this.quantity,
    this.unit,
    this.diaperType,
    this.extraFields = const {},
  });

  factory DailyLogModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {
      '_id',
      'childId',
      'logType',
      'startTime',
      'endTime',
      'notes',
      'quantity',
      'unit',
      'diaperType',
    };
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return DailyLogModel(
      id: json['_id'] as String? ?? '',
      childId: json['childId'] as String? ?? '',
      logType: json['logType'] as String? ?? '',
      startTime: json['startTime'] != null ? DateTime.tryParse(json['startTime']) : null,
      endTime: json['endTime'] != null ? DateTime.tryParse(json['endTime']) : null,
      notes: json['notes'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      diaperType: json['diaperType'] as String?,
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'childId': childId,
      'logType': logType,
      'startTime': startTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'notes': notes,
      'quantity': quantity,
      'unit': unit,
      'diaperType': diaperType,
      ...extraFields,
    };
  }
}
