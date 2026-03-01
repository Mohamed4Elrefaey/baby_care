// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_log_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyLogModelAdapter extends TypeAdapter<DailyLogModel> {
  @override
  final int typeId = 11;

  @override
  DailyLogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyLogModel(
      id: fields[0] as String,
      childId: fields[1] as String,
      logType: fields[2] as String,
      startTime: fields[3] as DateTime?,
      endTime: fields[4] as DateTime?,
      notes: fields[5] as String?,
      quantity: fields[6] as double?,
      unit: fields[7] as String?,
      diaperType: fields[8] as String?,
      extraFields: (fields[9] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, DailyLogModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.childId)
      ..writeByte(2)
      ..write(obj.logType)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.quantity)
      ..writeByte(7)
      ..write(obj.unit)
      ..writeByte(8)
      ..write(obj.diaperType)
      ..writeByte(9)
      ..write(obj.extraFields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyLogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
