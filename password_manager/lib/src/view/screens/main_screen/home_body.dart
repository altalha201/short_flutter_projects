import 'package:flutter/material.dart';

import 'counter_row.dart';
import 'greetings_header.dart';
import 'password_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: const [
          GreetingsHeader(),
          CounterRow(),
          SizedBox(height: 16.0),
          PasswordListView(),
        ],
      ),
    );
  }
}