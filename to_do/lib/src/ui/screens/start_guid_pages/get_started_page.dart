import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Center(
            child: Text("Get Started"),
          ),
        ),
        SizedBox(
          height: 48,
        )
      ],
    );
  }
}
