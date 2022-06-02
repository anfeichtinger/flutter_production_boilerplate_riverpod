import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_state.dart';

final AutoDisposeChangeNotifierProvider<ChangeThemeState> themeProvider =
    ChangeNotifierProvider.autoDispose(
        (AutoDisposeChangeNotifierProviderRef<ChangeThemeState> ref) {
  return ChangeThemeState();
});
