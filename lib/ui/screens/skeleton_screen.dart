import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/screens/first_screen.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/screens/second_screen.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/states/bottom_navigation/provider.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/app_bar_gone.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkeletonScreen extends ConsumerWidget {
  const SkeletonScreen({Key? key}) : super(key: key);

  final _pageNavigation = const [
    FirstScreen(),
    SecondScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(bottomNavProvider) as int;

    return Scaffold(
      appBar: const AppBarGone(),

      /// When switching between tabs this will fade the old
      /// layout out and the new layout in.
      body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _pageNavigation.elementAt(navIndex)),

      /// Cannot be const, tab status will not update.
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
