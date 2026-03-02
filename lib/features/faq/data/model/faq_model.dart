import 'package:hive/hive.dart';

part 'faq_model.g.dart';

@HiveType(typeId: 12)
class FaqModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String question;
  @HiveField(2)
  final String answer;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final List<String> keywords;
  @HiveField(5)
  final Map<String, dynamic> extraFields;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
    required this.keywords,
    this.extraFields = const {},
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {'_id', 'question', 'answer', 'category', 'keywords'};
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return FaqModel(
      id: json['_id'] as String? ?? '',
      question: json['question'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
      category: json['category'] as String? ?? '',
      keywords: List<String>.from(json['keywords'] ?? []),
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'question': question,
      'answer': answer,
      'category': category,
      'keywords': keywords,
      ...extraFields,
    };
  }
}
