import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottom_nav_bar_state.dart';

final AutoDisposeStateNotifierProvider<BottomNavBarState, Object?>
    bottomNavProvider = StateNotifierProvider.autoDispose(
        (AutoDisposeStateNotifierProviderRef<BottomNavBarState, Object?> ref) {
  return BottomNavBarState(0);
});
