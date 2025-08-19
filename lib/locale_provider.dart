import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('uz'); // Default locale

  Locale get locale => _locale;

  Future<void> setLocale(Locale newLocale) async {
    if (_locale == newLocale) return;
    _locale = newLocale;
    notifyListeners();
  }
}

final locales = ['uz', 'ru', 'en', 'ar', 'zh'];
final localeText = {
  'uz': 'UZ',
  'ru': 'RU',
  'en': 'EN',
  'ar': 'AR',
  'zh': '央',
};
