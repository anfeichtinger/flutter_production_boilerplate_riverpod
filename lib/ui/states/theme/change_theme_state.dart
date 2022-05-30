import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ChangeThemeState extends ChangeNotifier {
  bool darkMode = Hive.box('prefs').get('darkMode', defaultValue: false);

  void enableDarkMode() {
    darkMode = true;
    Hive.box('prefs').put('darkMode', true);
    notifyListeners();
  }

  void enableLightMode() {
    darkMode = false;
    Hive.box('prefs').put('darkMode', false);
    notifyListeners();
  }
}
