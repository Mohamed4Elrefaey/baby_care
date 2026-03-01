import 'package:hive/hive.dart';
part 'doctor_model.g.dart';

@HiveType(typeId: 10)
class DoctorModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final String specialty;
  @HiveField(4)
  final String bio;
  @HiveField(5)
  final String whatsappNumber;
  @HiveField(6)
  final List<String> clinics;
  @HiveField(7)
  final String workingHours;
  @HiveField(8)
  final double price;
  @HiveField(9)
  final String address;
  @HiveField(10)
  final String phone;
  @HiveField(11)
  final Map<String, dynamic> extraFields;

  DoctorModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.specialty,
    required this.bio,
    required this.whatsappNumber,
    required this.clinics,
    required this.workingHours,
    required this.price,
    required this.address,
    required this.phone,
    this.extraFields = const {},
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    final knownKeys = {
      '_id',
      'name',
      'imageUrl',
      'specialty',
      'bio',
      'whatsappNumber',
      'clinics',
      'workingHours',
      'price',
      'address',
      'phone',
    };
    final extra = Map<String, dynamic>.from(json)
      ..removeWhere((key, value) => knownKeys.contains(key));

    return DoctorModel(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      specialty: json['specialty'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      whatsappNumber: json['whatsappNumber'] as String? ?? '',
      clinics: List<String>.from(json['clinics'] ?? []),
      workingHours: json['workingHours'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      address: json['address'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      extraFields: extra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'imageUrl': imageUrl,
      'specialty': specialty,
      'bio': bio,
      'whatsappNumber': whatsappNumber,
      'clinics': clinics,
      'workingHours': workingHours,
      'price': price,
      'address': address,
      'phone': phone,
      ...extraFields,
    };
  }
}
