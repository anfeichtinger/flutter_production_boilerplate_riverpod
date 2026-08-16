import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/config/style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/widgets/bottom_nav_bar/bottom_nav_bar_state.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? navIndex = ref.watch(bottomNavProvider) as int?;

    return Card(
      margin: const EdgeInsets.all(0),
      elevation: Theme.of(context).bottomNavigationBarTheme.elevation,
      shadowColor: Theme.of(context).colorScheme.shadow,
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Style.radiusLg,
          topRight: Style.radiusLg,
        ),
        side: BorderSide(
          color: Theme.of(context).shadowColor,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: navIndex ?? 0,
        onTap: (int index) {
          ref.read(bottomNavProvider.notifier).setAndPersistValue(index);
        },
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(FluentIcons.home_24_regular),
            label: tr('bottom_nav_first'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(FluentIcons.info_24_regular),
            label: tr('bottom_nav_second'),
          ),
        ],
      ),
    );
  }
}
