import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class BottomNavBarState extends StateNotifier<int> {
  BottomNavBarState(super.state) {
    value = Hive.box('prefs').get('navIndex', defaultValue: state) as int;
  }

  set value(int index) => state = index;

  int get value => state;

  void setAndPersistValue(int index) {
    value = index;
    Hive.box('prefs').put('navIndex', index);
  }
}
