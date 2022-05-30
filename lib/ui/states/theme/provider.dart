import 'package:flutter_production_boilerplate_riverpod/ui/states/theme/change_theme_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider.autoDispose((ref) {
  return ChangeThemeState();
});
