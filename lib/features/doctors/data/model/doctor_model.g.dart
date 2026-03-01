// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorModelAdapter extends TypeAdapter<DoctorModel> {
  @override
  final int typeId = 10;

  @override
  DoctorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorModel(
      id: fields[0] as String,
      name: fields[1] as String,
      imageUrl: fields[2] as String,
      specialty: fields[3] as String,
      bio: fields[4] as String,
      whatsappNumber: fields[5] as String,
      clinics: (fields[6] as List).cast<String>(),
      workingHours: fields[7] as String,
      price: fields[8] as double,
      address: fields[9] as String,
      phone: fields[10] as String,
      extraFields: (fields[11] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, DoctorModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.specialty)
      ..writeByte(4)
      ..write(obj.bio)
      ..writeByte(5)
      ..write(obj.whatsappNumber)
      ..writeByte(6)
      ..write(obj.clinics)
      ..writeByte(7)
      ..write(obj.workingHours)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.extraFields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
