import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hive/hive.dart';

final ChangeNotifierProvider<ThemeModeState> themeProvider =
    ChangeNotifierProvider.autoDispose((ref) => ThemeModeState());

class ThemeModeState extends ChangeNotifier {
  ThemeModeState() {
    final String mode = Hive.box<dynamic>(
      'prefs',
    ).get('themeMode', defaultValue: ThemeMode.system.toString()) as String;
    switch (mode) {
      case 'ThemeMode.dark':
        themeMode = ThemeMode.dark;
        break;
      case 'ThemeMode.light':
        themeMode = ThemeMode.light;
        break;
      case 'ThemeMode.system':
        themeMode = ThemeMode.system;
        break;
    }
  }

  ThemeMode? themeMode;

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    Hive.box<dynamic>('prefs').put('themeMode', themeMode.toString());
    notifyListeners();
  }
}
