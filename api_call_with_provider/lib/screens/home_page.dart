import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/custom_floating_button.dart';
import 'menu_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        context: context,
        title: title,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenuPage(),
                ),
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Center(
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) => Text(
            "Test Text",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: themeProvider.backgroundColor,
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        onTap: () {},
      ),
    );
  }
}
