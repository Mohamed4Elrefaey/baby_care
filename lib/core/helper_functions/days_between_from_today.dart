int daysBetweenFromToday(DateTime? targetDate) {
  if (targetDate == null) return 0;
  final today = DateTime.now();

  final from = DateTime(today.year, today.month, today.day);
  final to = DateTime(targetDate.year, targetDate.month, targetDate.day);

  return to.difference(from).inDays;
}
