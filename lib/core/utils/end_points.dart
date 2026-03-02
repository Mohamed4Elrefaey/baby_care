class ApiEndpoints {
  // Authentication
  static const String register = "/auth/register";
  static const String login = "/auth/login";

  // Articles
  static const String articles = "/articles";
  static String article(String id) => "/articles/$id";


  // عشان الايرورز بس ياعلي 
  static const String changePassword = "/auth/change-password";
  static const String updateFcmToken =
      "/auth/fcm-token"; // PUT: تحديث توكن الإشعارات
  static const String chatbotSearch = "/faqs/search"; // GET (يحتاج ?q=...)
  static String faq(String faqId) => "/faqs/$faqId"; // GET


  
  // Children
  static const String children = "/children";
  static const String myChildren = "/children/my-children";
  static String childVaccinationSchedule(String id) => "/children/$id/vaccination-schedule";

  // Comments
  static String postComments(String postId) => "/comments/$postId";
  static String deleteComment(String commentId) => "/comments/$commentId";
  static String commentsByPost(String postId) => "/comments/post/$postId";
  static String toggleCommentLike(String commentId) => "/comments/$commentId/toggle-like";

  // Daily Logs
  static const String logs = "/logs";
  static String childLogs(String childId) => "/logs/child/$childId";
  static String deleteLog(String logId) => "/logs/$logId";
  static String logSummary(String childId) => "/logs/child/$childId/summary";

  // Doctors
  static const String doctors = "/doctors";
  static const String nearbyDoctors = "/doctors/nearby";

  // FAQs
  static const String faqs = "/faqs";
  static const String faqSearch = "/faqs/search";

  // Growth
  static const String growth = "/growth";
  static String childGrowth(String childId) => "/growth/child/$childId";
  static String growthStats(String childId) => "/growth/child/$childId/stats";

  // Locations
  static const String locations = "/locations";
  static String deleteLocation(String id) => "/locations/$id";

  // Medicines
  static const String medicines = "/medicines";
  static String medicine(String id) => "/medicines/$id";

  // Notifications
  static const String notifications = "/notifications";
  static String markNotificationRead(String id) => "/notifications/$id/read";
  static const String sendNotification = "/notifications/send";
  static const String markAllNotificationsRead = "/notifications/mark-all-read";
  static String deleteNotification(String id) => "/notifications/$id";

  // Posts
  static const String posts = "/posts";
  static String post(String postId) => "/posts/$postId";
  static String postAction(String postId) => "/posts/$postId/action";
  static String savePost(String postId) => "/posts/$postId/save";

  // Records
  static String childRecords(String childId) => "/records/child/$childId";
  static String takeRecord(String id) => "/records/$id/take";
  static String undoRecord(String id) => "/records/$id/undo";
  static String overdueRecords(String childId) => "/records/child/$childId/overdue";
  static String calculateRecords(String childId) => "/records/child/$childId/calculate";

  // Sounds
  static const String sounds = "/sounds";
  static String sound(String id) => "/sounds/$id";

  // Vaccines
  static const String vaccines = "/vaccines";
  static const String seedVaccines = "/vaccines/seed";
}
