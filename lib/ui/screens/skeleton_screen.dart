import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../states/widgets/bottom_nav_bar/bottom_nav_bar_state.dart';
import '../widgets/app_bar_gone.dart';
import '../widgets/bottom_nav_bar.dart';
import 'first_screen.dart';
import 'second_screen.dart';

class SkeletonScreen extends ConsumerWidget {
  const SkeletonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? navIndex = ref.watch(bottomNavProvider) as int?;
    const List<Widget> pageNavigation = <Widget>[
      FirstScreen(),
      SecondScreen(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarGone(),

      /// When switching between tabs this will fade the old
      /// layout out and the new layout in.
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pageNavigation.elementAt(navIndex ?? 0),
      ),

      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
