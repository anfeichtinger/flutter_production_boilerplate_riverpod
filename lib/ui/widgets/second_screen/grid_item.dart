import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Uri url;
  final String? version;

  /// Named parameters are preferred, they make the code easier to understand.
  const GridItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.url,
      this.version})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: ListTile(
        onTap: _launchUrl,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            Text(
              tr(title),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .apply(fontWeightDelta: 2),
            ),
            version != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      version!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  /// Example: Use the url_launcher package to open the browser
  void _launchUrl() async => await canLaunchUrl(url)
      ? await launchUrl(url)
      : throw 'Could not launch $url';
}
