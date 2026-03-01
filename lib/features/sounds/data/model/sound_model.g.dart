// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SoundModelAdapter extends TypeAdapter<SoundModel> {
  @override
  final int typeId = 8;

  @override
  SoundModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SoundModel(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      category: fields[3] as String,
      audioUrl: fields[4] as String,
      imageUrl: fields[5] as String,
      extraFields: (fields[6] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, SoundModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.audioUrl)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.extraFields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoundModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
