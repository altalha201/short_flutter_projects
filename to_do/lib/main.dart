import 'package:flutter/material.dart';

import 'src/ui/screens/home_page.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "To Do",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
