import 'package:flutter/material.dart';

class LocalizationInit {
  final List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TUR'),
  ];

  final String localizationPath = 'assets/translations';
}
