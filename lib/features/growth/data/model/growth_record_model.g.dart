// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GrowthRecordModelAdapter extends TypeAdapter<GrowthRecordModel> {
  @override
  final int typeId = 13;

  @override
  GrowthRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GrowthRecordModel(
      id: fields[0] as String,
      childId: fields[1] as String,
      weight: fields[2] as double,
      height: fields[3] as double,
      headCircumference: fields[4] as double?,
      dateOfMeasurement: fields[5] as DateTime?,
      notes: fields[6] as String?,
      extraFields: (fields[7] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, GrowthRecordModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.childId)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.headCircumference)
      ..writeByte(5)
      ..write(obj.dateOfMeasurement)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.extraFields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrowthRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
