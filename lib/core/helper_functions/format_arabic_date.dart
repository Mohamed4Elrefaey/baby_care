import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatArabicDate(String? isoDate, BuildContext context) {
  if (isoDate == null) return '—';
  try {
    final date = DateTime.parse(isoDate).toLocal();
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat('d MMMM y', locale).format(date);
  } catch (e) {
    return '—';
  }
}
