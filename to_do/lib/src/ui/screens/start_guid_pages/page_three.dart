import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Center(
            child: Text("Delete Task"),
          ),
        ),
        SizedBox(
          height: 48,
        )
      ],
    );
  }
}
