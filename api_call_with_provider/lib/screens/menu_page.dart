import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/common_app_bar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: commonAppBar(
        context: context,
        title: "Customize Theme",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "Select Background Color",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Wrap(
              children: [
                ColorPicker(
                  pickerColor: provider.backgroundColor,
                  onColorChanged: (color) =>
                      provider.changeBackgroundColor(color),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      themeProvider.changeForegroundColor();
                    },
                    child: Text(
                      "Change Foreground Color to ${themeProvider.foregroundIsWhite ? "Black" : "White"}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
