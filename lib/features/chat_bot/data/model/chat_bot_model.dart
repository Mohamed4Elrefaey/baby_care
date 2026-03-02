import 'package:hive/hive.dart';
part 'chat_bot_model.g.dart';

@HiveType(typeId: 6)
class ChatBotModel {
  @HiveField(0)
  final String tixt;
  @HiveField(1)
  final bool isAnswer;
  @HiveField(2)
  final Map<String, dynamic> extraFields;

  ChatBotModel({
    required this.tixt,
    required this.isAnswer,
    this.extraFields = const {},
  });

  factory ChatBotModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {'tixt', 'isAnswer'};
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return ChatBotModel(
      tixt: json['tixt'] as String? ?? '',
      isAnswer: json['isAnswer'] as bool? ?? false,
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {'tixt': tixt, 'isAnswer': isAnswer, ...extraFields};
  }
}
