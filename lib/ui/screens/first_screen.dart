import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/config/style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/first_screen/theme_card.dart';
import '../widgets/header.dart';

class FirstScreen extends ConsumerWidget {
  const FirstScreen({super.key});

  static const List<bool> infoCardPattern = <bool>[true, false, false, true];
  static const List<Map<String, dynamic>> infoCards = <Map<String, dynamic>>[
    <String, dynamic>{
      'title': 'localization_title',
      'content': 'localization_content',
      'icon': FluentIcons.local_language_24_regular,
    },
    <String, dynamic>{
      'title': 'linting_title',
      'content': 'linting_content',
      'icon': FluentIcons.code_24_regular,
    },
    <String, dynamic>{
      'title': 'storage_title',
      'content': 'storage_content',
      'icon': FluentIcons.folder_open_24_regular,
    },
    <String, dynamic>{
      'title': 'dark_mode_title',
      'content': 'dark_mode_content',
      'icon': FluentIcons.weather_moon_24_regular,
    },
    <String, dynamic>{
      'title': 'state_title',
      'content': 'state_content',
      'icon': FluentIcons.leaf_three_24_regular,
    },
    <String, dynamic>{
      'title': 'display_title',
      'content': 'display_content',
      'icon': FluentIcons.top_speed_24_regular,
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Header(text: 'Settings'),

          Card(
            elevation: 0,
            shadowColor: Theme.of(context).colorScheme.shadow,

            /// Example: Many items have their own colors inside of the ThemData
            /// You can overwrite them in [config/style.dart].
            color: Theme.of(context).colorScheme.surfaceContainer,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Style.radiusMd),
              side: BorderSide(color: Theme.of(context).shadowColor),
            ),
            child: SwitchListTile(
              onChanged: (bool newValue) {
                /// Example: Change locale
                /// The initial locale is automatically determined by the library.
                /// Changing the locale like this will persist the selected locale.
                context.setLocale(
                  newValue ? const Locale('de') : const Locale('en'),
                );
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Style.radiusMd),
              ),
              value: context.locale == const Locale('de'),
              inactiveTrackColor: Theme.of(context)
                  .colorScheme
                  .surfaceContainer,

              /// You can use a FittedBox to keep Text in its bounds.
              title: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Row(
                  children: <Widget>[
                    Icon(
                      FluentIcons.local_language_24_regular,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      tr('language_switch_title'),
                      style: Theme.of(context).textTheme.titleMedium!
                          .apply(fontWeightDelta: 2),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Example: Good way to add space between items without using Paddings
          const SizedBox(height: 8),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <ThemeCard>[
              ThemeCard(
                mode: ThemeMode.system,
                icon: FluentIcons.dark_theme_24_regular,
              ),
              ThemeCard(
                mode: ThemeMode.light,
                icon: FluentIcons.weather_sunny_24_regular,
              ),
              ThemeCard(
                mode: ThemeMode.dark,
                icon: FluentIcons.weather_moon_24_regular,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Divider(color: Theme.of(context).dividerColor),
          ),

          const SizedBox(height: 36),
        ],
      ),
    );
  }

  /// This will determine which info cards should render in primary color based on the given pattern.
  bool infoCardShouldBePrimary(int index) {
    return infoCardPattern[index % infoCardPattern.length];
  }
}
