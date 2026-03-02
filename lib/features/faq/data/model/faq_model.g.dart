// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FaqModelAdapter extends TypeAdapter<FaqModel> {
  @override
  final int typeId = 12;

  @override
  FaqModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FaqModel(
      id: fields[0] as String,
      question: fields[1] as String,
      answer: fields[2] as String,
      category: fields[3] as String,
      keywords: (fields[4] as List).cast<String>(),
      extraFields: (fields[5] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, FaqModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.answer)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.keywords)
      ..writeByte(5)
      ..write(obj.extraFields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaqModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
