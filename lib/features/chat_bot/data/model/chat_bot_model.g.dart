// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bot_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatBotModelAdapter extends TypeAdapter<ChatBotModel> {
  @override
  final int typeId = 6;

  @override
  ChatBotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatBotModel(
      tixt: fields[0] as String,
      isAnswer: fields[1] as bool,
      extraFields: (fields[2] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChatBotModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tixt)
      ..writeByte(1)
      ..write(obj.isAnswer)
      ..writeByte(2)
      ..write(obj.extraFields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatBotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
