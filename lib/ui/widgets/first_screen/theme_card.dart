import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/config/style.dart';
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

    return Expanded(
      child: Card(
        elevation: 0,
        shadowColor: Theme.of(context).colorScheme.shadow,
        color: state.themeMode == mode
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Style.radiusMd),
          side: BorderSide(color: Theme.of(context).shadowColor),
        ),
        child: SizedBox(
          height: 52,
          child: InkWell(
            onTap: () => ref.watch(themeProvider.notifier).setThemeMode(mode),
            borderRadius: const BorderRadius.all(Style.radiusMd),
            child: Icon(
              icon,
              size: 32,
              color: state.themeMode != mode
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
