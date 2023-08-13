import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Center(
            child: Text("Add Your Task"),
          ),
        ),
        SizedBox(
          height: 48,
        )
      ],
    );
  }
}
