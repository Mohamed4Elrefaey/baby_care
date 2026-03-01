import 'package:baby_care/features/auth/data/model/user_model.dart';
import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:baby_care/features/blog/data/model/comment_model.dart';
import 'package:baby_care/features/blog/data/model/post_model.dart';
import 'package:baby_care/features/chat_bot/data/model/chat_bot_model.dart';
import 'package:baby_care/features/children/data/model/child_model.dart';
import 'package:baby_care/features/daily_log/data/model/daily_log_model.dart';
import 'package:baby_care/features/doctors/data/model/doctor_model.dart';
import 'package:baby_care/features/faq/data/model/faq_model.dart';
import 'package:baby_care/features/growth/data/model/growth_record_model.dart';
import 'package:baby_care/features/locations/data/model/health_unit_model.dart';
import 'package:baby_care/features/medicine/data/model/medicine_model.dart';
import 'package:baby_care/features/sounds/data/model/sound_model.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_model.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  static Future<Box> openBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    } else {
      return await Hive.openBox(boxName);
    }
  }

  static Future<void> putData({
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    final box = await openBox(boxName);
    await box.put(key, value);
  }

  static Future<dynamic> getData({
    required String boxName,
    required String key,
  }) async {
    final box = await openBox(boxName);
    return box.get(key);
  }

  static Future<void> deleteData({
    required String boxName,
    required String key,
  }) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  static Future<void> clearBox(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  static void registerAdapter() {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(ChildModelAdapter());
    Hive.registerAdapter(VaccineModelAdapter());
    Hive.registerAdapter(VaccineRecordModelAdapter());
    Hive.registerAdapter(ChatBotModelAdapter());
    Hive.registerAdapter(ArticleModelAdapter());
    Hive.registerAdapter(SoundModelAdapter());
    Hive.registerAdapter(MedicineModelAdapter());
    Hive.registerAdapter(DoctorModelAdapter());
    Hive.registerAdapter(DailyLogModelAdapter());
    Hive.registerAdapter(FaqModelAdapter());
    Hive.registerAdapter(GrowthRecordModelAdapter());
    Hive.registerAdapter(PostModelAdapter());
    Hive.registerAdapter(CommentModelAdapter());
    Hive.registerAdapter(HealthUnitModelAdapter());
  }

  static Future<bool> containsKey({
    required String boxName,
    required String key,
  }) async {
    final box = await openBox(boxName);
    return box.containsKey(key);
  }

  static Future<List> getAllValues(String boxName) async {
    final box = await openBox(boxName);
    return box.values.toList();
  }

  static Future<void> deletAt(String boxName, int index) async {
    final box = await openBox(boxName);
    box.deleteAt(index);
  }

  static Future<String> getKeyAt(String boxName, int index) async {
    final box = await openBox(boxName);
    return box.keyAt(index);
  }
}
