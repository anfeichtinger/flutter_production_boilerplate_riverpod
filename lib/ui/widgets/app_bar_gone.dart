import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarGone extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGone({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;

    /// This is a reliable way to change the statusbar icons and color
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark),
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottomOpacity: 0,
      toolbarOpacity: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
