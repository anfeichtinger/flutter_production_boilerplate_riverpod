import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_production_boilerplate_riverpod/config/theme.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/screens/skeleton_screen.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/states/theme/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

/// Try using const constructors as much as possible!

void main() async {
  /// Initialize packages
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  final tmpDir = await getTemporaryDirectory();
  await Hive.initFlutter(tmpDir.toString());
  await Hive.openBox('prefs');

  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en'),
          Locale('de'),
        ],
        fallbackLocale: const Locale('en'),
        useFallbackTranslations: true,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);

    return MaterialApp(
      /// Localization is not available for the title.
      title: 'Flutter Production Boilerplate',

      /// Theme stuff
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: currentTheme.darkMode ? ThemeMode.dark : ThemeMode.light,

      /// Localization stuff
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: const SkeletonScreen(),
    );
  }
}
