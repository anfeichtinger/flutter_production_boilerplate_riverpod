import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class ChangeBottomNavState extends StateNotifier<int> {
  ChangeBottomNavState(super.state) {
    value = Hive.box('prefs').get('navIndex', defaultValue: state);
  }

  set value(int index) => state = index;

  void setAndPersistValue(int index) {
    value = index;
    Hive.box('prefs').put('navIndex', index);
  }
}
