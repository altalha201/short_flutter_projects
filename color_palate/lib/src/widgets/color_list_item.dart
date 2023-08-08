import 'package:flutter/material.dart';

import '../functions/main_page_functions.dart';

class ColorListItem extends StatelessWidget {
  const ColorListItem({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text(
          "RGB(${color.red}, ${color.green}, ${color.blue})", // converting the color to RGB color code string
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "#${color.value.toRadixString(16).substring(2).toUpperCase()}", // converting the color to Hex code string
        ),
        trailing: PopupMenuButton(
          icon: Icon(
            Icons.copy_rounded,
            color: color,
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: const Text("Copy RGB"),
                onTap: () {
                  MainPageFunctions.copyToClipBoard(
                      "(${color.red}, ${color.green}, ${color.blue})");
                },
              ),
              PopupMenuItem(
                child: const Text("Copy Hex"),
                onTap: () {
                  MainPageFunctions.copyToClipBoard(
                      "#${color.value.toRadixString(16).substring(2).toUpperCase()}");
                },
              ),
            ];
          },
        ),
      ),
    );
  }
}
