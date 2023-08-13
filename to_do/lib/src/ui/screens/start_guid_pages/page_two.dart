import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Center(
            child: Text("Mark Completed"),
          ),
        ),
        SizedBox(
          height: 48,
        )
      ],
    );
  }
}
