import 'package:flutter_riverpod/legacy.dart';
import 'package:hive/hive.dart';

final StateNotifierProvider<BottomNavBarState, Object?> bottomNavProvider =
    StateNotifierProvider.autoDispose((ref) => BottomNavBarState(0));

class BottomNavBarState extends StateNotifier<int> {
  BottomNavBarState(super.state) {
    value =
        Hive.box<dynamic>('prefs').get('navIndex', defaultValue: state) as int;
  }

  set value(int index) => state = index;

  int get value => state;

  void setAndPersistValue(int index) {
    value = index;
    Hive.box<dynamic>('prefs').put('navIndex', index);
  }
}
