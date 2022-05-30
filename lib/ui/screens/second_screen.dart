import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/header.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/second_screen/grid_item.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/second_screen/link_card.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/widgets/second_screen/text_divider.dart';
import 'package:ionicons/ionicons.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: [
            const Header(text: 'bottom_nav_second'),
            LinkCard(
                title: 'github_card_title',
                icon: Ionicons.logo_github,
                url: Uri.parse(
                    'https://github.com/anfeichtinger/flutter_production_boilerplate')),
            const TextDivider(text: 'author_divider_title'),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2 / 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              children: [
                GridItem(
                  title: 'instagram_card_title',
                  icon: Ionicons.logo_instagram,
                  url: Uri.parse('https://www.instagram.com/anfeichtinger'),
                ),
                GridItem(
                  title: 'twitter_card_title',
                  icon: Ionicons.logo_twitter,
                  url: Uri.parse('https://twitter.com/_pharrax'),
                ),
                GridItem(
                  title: 'donate_card_title',
                  icon: Ionicons.heart_outline,
                  url: Uri.parse(
                      'https://www.paypal.com/donate?hosted_button_id=EE3W7PS6AHEP8&source=url'),
                ),
                GridItem(
                  title: 'website_card_title',
                  icon: Ionicons.desktop_outline,
                  url: Uri.parse('https://feichtinger.dev'),
                ),
              ],
            ),
            const TextDivider(text: 'packages_divider_title'),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2 / 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              children: [
                GridItem(
                  title: 'flutter_riverpod',
                  icon: Ionicons.water_outline,
                  url: Uri.parse(
                      'https://pub.dev/packages/flutter_riverpod/versions/1.0.4'),
                  version: '1.0.4',
                ),
                GridItem(
                  title: 'lints',
                  icon: Ionicons.code_slash_outline,
                  url: Uri.parse(
                      'https://pub.dev/packages/flutter_lints/versions/2.0.1'),
                  version: '2.0.1',
                ),
                GridItem(
                  title: 'path_provider',
                  icon: Ionicons.extension_puzzle_outline,
                  url: Uri.parse(
                      'https://pub.dev/packages/path_provider/versions/2.0.10'),
                  version: '2.0.10',
                ),
                GridItem(
                  title: 'flutter_displaymode',
                  icon: Ionicons.speedometer_outline,
                  url: Uri.parse(
                      'https://pub.dev/packages/flutter_displaymode/versions/0.4.0'),
                  version: '0.4.0',
                ),
                GridItem(
                  title: 'easy_localization',
                  icon: Ionicons.text_outline,
                  url: Uri.parse(
                      'https://pub.dev/packages/easy_localization/versions/3.0.1'),
                  version: '3.0.1',
                ),
                GridItem(
                  title: 'hive',
                  icon: Ionicons.folder_open_outline,
                  url:
                      Uri.parse('https://pub.dev/packages/hive/versions/2.2.1'),
                  version: '2.2.1',
                ),
                GridItem(
                  title: 'url_launcher',
                  icon: Ionicons.share_outline,
                  url: Uri.parse(
                      'https://pub.dev/packages/url_launcher/versions/6.1.2'),
                  version: '6.1.2',
                ),
                GridItem(
                  title: 'ionicons',
                  icon: Ionicons.logo_ionic,
                  url: Uri.parse(
                      'https://pub.dev/packages/ionicons/versions/0.1.2'),
                  version: '0.1.2',
                ),
              ],
            ),
            const SizedBox(height: 36),
          ]),
    );
  }
}
