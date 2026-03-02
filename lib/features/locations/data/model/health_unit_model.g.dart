// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_unit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HealthUnitModelAdapter extends TypeAdapter<HealthUnitModel> {
  @override
  final int typeId = 16;

  @override
  HealthUnitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HealthUnitModel(
      id: fields[0] as String,
      name: fields[1] as String,
      governorate: fields[2] as String,
      city: fields[3] as String,
      extraFields: (fields[4] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, HealthUnitModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.governorate)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.extraFields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthUnitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
