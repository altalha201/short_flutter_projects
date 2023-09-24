import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key, required this.onTap, this.child,
  });

  final VoidCallback onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return FloatingActionButton(
            onPressed: onTap,
            backgroundColor: themeProvider.backgroundColor,
            foregroundColor: themeProvider.foregroundColor,
            child: child,
          );
        }
    );
  }
}