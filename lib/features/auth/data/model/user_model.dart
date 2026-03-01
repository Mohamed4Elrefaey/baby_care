import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final Map<String, dynamic> extraFields;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.extraFields = const {},
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {'_id', 'name', 'email'};
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return UserModel(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'email': email, ...extraFields};
  }
}
