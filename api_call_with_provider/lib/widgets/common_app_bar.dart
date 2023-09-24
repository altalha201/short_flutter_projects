import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

PreferredSizeWidget commonAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(64),
    child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return AppBar(
            title: Text(title),
            backgroundColor: themeProvider.backgroundColor,
            foregroundColor: themeProvider.foregroundColor,
            actions: actions,
          );
        }
    ),
  );
}
