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
  final int price;
  @HiveField(9)
  final String address;
  @HiveField(10)
  final String phone;

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
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'].toString(),
      name: json['name'],
      imageUrl: json['imageUrl'],
      specialty: json['specialty'],
      bio: json['bio'],
      whatsappNumber: json['whatsappNumber'],
      clinics: List<String>.from(json['clinics'] ?? []),
      workingHours: json['workingHours'],
      price: json['price'].toInt(),
      address: json['address'],
      phone: json['phone'],
    );
  }
}
