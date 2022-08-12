import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../states/theme_mode_state.dart';

class ThemeCard extends ConsumerWidget {
  const ThemeCard({
    super.key,
    required this.mode,
    required this.icon,
  });

  final IconData icon;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeModeState state = ref.watch(themeProvider);

    return Card(
      elevation: 2,
      shadowColor: Theme.of(context).colorScheme.shadow,
      color: state.themeMode == mode
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: InkWell(
        onTap: () => ref.watch(themeProvider.notifier).setThemeMode(mode),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Icon(
          icon,
          size: 32,
          color: state.themeMode != mode
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
        ),
      ),
    );
  }
}
