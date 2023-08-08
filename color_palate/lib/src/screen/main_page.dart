import 'package:flutter/material.dart';

import '../functions/main_page_functions.dart';
import '../widgets/color_box.dart';
import '../widgets/color_list_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Color> _colors = []; // list of colors

  @override
  void initState() {
    setState(() {
      _colors = MainPageFunctions.generateColors();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Row(
                    children: [
                      for (var color in _colors)
                        ColorBox(color: color),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var color in _colors)
                      ColorListItem(color: color),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // updating the color list
          setState(() {
            _colors = MainPageFunctions.generateColors();
          });
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.refresh_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // position the floating button to center
    );
  }
}