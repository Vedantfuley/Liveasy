import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._();
    return _instance!;
  }

  LanguageManager._() : _currentLocale = const Locale('en', '');

  Locale _currentLocale;
  Map<String, String>? _localizedValues;

  Locale get currentLocale => _currentLocale;

  Future<void> loadTranslations() async {
    String jsonString = await rootBundle.loadString(
      'lib/i18n/${_currentLocale.languageCode}.json',
    );
     Map<String, dynamic> decodedJson = json.decode(jsonString);
  _localizedValues = Map<String, String>.from(decodedJson);
}
  

  String getTranslatedValue(String key) {
    return _localizedValues?[key] ?? 'Translation not found';
  }

  Future<void> setLocale(Locale locale) async {
    _currentLocale = locale;
    await loadTranslations();
  }
}

