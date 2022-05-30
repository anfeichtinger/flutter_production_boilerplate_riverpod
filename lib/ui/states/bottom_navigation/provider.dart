import 'package:flutter_production_boilerplate_riverpod/ui/states/bottom_navigation/change_bottom_nav_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavProvider = StateNotifierProvider.autoDispose((ref) {
  return ChangeBottomNavState(0);
});
