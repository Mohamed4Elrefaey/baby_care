class ApiEndpoints {
  // ==============================================================================
  // 1. المصادقة (Authentication)
  // ==============================================================================
  static const String register = "auth/register";
  static const String login = "auth/login";
  static const String changePassword = "/auth/change-password";
  // static const String googleLogin = "/auth/google";
  // static const String facebookLogin = "/auth/facebook";

  // الملف الشخصي
  static const String myProfile =
      "/auth/me"; // GET: جلب البيانات, DELETE: حذف الحساب
  static const String updateProfile = "/auth/profile"; // PUT: تعديل البيانات
  static const String updateFcmToken =
      "/auth/fcm-token"; // PUT: تحديث توكن الإشعارات

  // ==============================================================================
  // 2. الوحدات الصحية (للاختيار في القوائم فقط)
  // ==============================================================================
  static const String healthUnits = "/locations"; // GET Only

  // ==============================================================================
  // 3. الأطفال (Children)
  // ==============================================================================
  static const String children =
      "/children"; // POST: إضافة طفل (ممرضة), GET: بحث (ممرضة)
  static const String myChildren = "children/my-children"; // GET: أطفالي (للأم)
  static String child(String childId) =>
      "/children/$childId"; // GET: تفاصيل, PUT: تعديل

  // ==============================================================================
  // 4. سجلات التطعيمات (Vaccination Records)
  // ==============================================================================
  static String childVaccinationSchedule(String childId) =>
      "children/$childId/vaccination-schedule"; // GET: عرض الجدول
  static String childVaccinationScheduleHome(String childId) =>
      "/records/child/$childId?mode=home"; // GET: عرض الجدول
  static String updateVaccineStatus(String scheduleId) =>
      "/records/$scheduleId"; // PUT: تأكيد التطعيم (ممرضة)

  // ==============================================================================
  // 5. سجلات النمو (Growth Records) - للأم
  // ==============================================================================
  static const String growth = "/growth"; // POST: إضافة قياس
  static String childGrowthHistory(String childId) =>
      "/growth/child/$childId"; // GET: سجل القياسات
  static String growthRecord(String recordId) =>
      "/growth/$recordId"; // PUT: تعديل, DELETE: حذف

  // ==============================================================================
  // 6. السجلات اليومية (Daily Logs) - للأم
  // ==============================================================================
  static const String logs = "/logs"; // POST: إضافة سجل (نوم/رضاعة)
  static String childLogs(String childId) =>
      "/logs/child/$childId"; // GET: عرض السجلات
  static String logRecord(String logId) =>
      "/logs/$logId"; // PUT: تعديل, DELETE: حذف

  // ==============================================================================
  // 7. يوميات الطفل/الذكريات (Diary) - للأم
  // ==============================================================================
  static const String diary = "/diary"; // POST: إضافة ذكرى
  static String childDiary(String childId) =>
      "/diary/child/$childId"; // GET: عرض الذكريات
  static String diaryEntry(String entryId) =>
      "/diary/$entryId"; // PUT: تعديل, DELETE: حذف

  // ==============================================================================
  // 8. المجتمع (Community/Posts) - تفاعلي
  // ==============================================================================
  static const String posts = "/posts"; // GET: كل البوستات, POST: نشر بوست
  static String post(String postId) =>
      "/posts/$postId"; // GET: تفاصيل بوست, DELETE: حذف (لصاحب البوست)
  static String postComments(String postId) =>
      "/posts/$postId/comments"; // POST: تعليق
  static String deleteComment(String commentId) =>
      "/comments/$commentId"; // DELETE: حذف تعليق
  static String toggleLike(String postId) =>
      "/posts/$postId/like"; // PUT: لايك/ديسلايك

  // ==============================================================================
  // 9. المحتوى الطبي (عرض فقط - View Only)
  // ==============================================================================

  // المقالات
  static const String articles = "/articles"; // GET
  static String article(String articleId) => "/articles/$articleId"; // GET

  // الأدوية
  static const String medicines = "/medicines"; // GET
  static String medicine(String medicineId) => "/medicines/$medicineId"; // GET

  // الأطباء
  static const String doctors = "/doctors"; // GET
  static const String nearbyDoctors = "/doctors/nearby"; // GET (يحتاج lat, lng)
  static String doctor(String doctorId) => "/doctors/$doctorId"; // GET

  // الأصوات
  static const String sounds = "/sounds"; // GET
  static String sound(String soundId) => "/sounds/$soundId"; // GET

  // الوصفات
  static const String recipes = "/recipes"; // GET
  static String recipe(String recipeId) => "/recipes/$recipeId"; // GET (تفاصيل)

  // ==============================================================================
  // 10. الشات بوت والأسئلة الشائعة
  // ==============================================================================
  static const String faqs = "/faqs"; // GET
  static const String chatbotSearch = "/faqs/search"; // GET (يحتاج ?q=...)
  static String faq(String faqId) => "/faqs/$faqId"; // GET

  // ==============================================================================
  // 11. الإشعارات
  // ==============================================================================
  static const String notifications =
      "/admin/notifications/logs"; // GET (اسم الرابط في البوستمان غريب لكنه للمستخدم)

  // ==============================================================================
  // 12. تعريفات التطعيمات (للعرض فقط)
  // ==============================================================================
  static const String vaccinesList =
      "/vaccines"; // GET: القائمة الرسمية للتطعيمات
}
