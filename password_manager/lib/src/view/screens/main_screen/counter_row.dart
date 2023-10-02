import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/navigation_helper.dart';
import '../add_item_screen/add_item_page.dart';

class CounterRow extends StatelessWidget {
  const CounterRow({
    super.key,
  });

  void _onAddNewTap() {
    NavigationHelper.to(
      const AddItemPage(),
      transition: Transition.rightToLeftWithFade,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _countSection(),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: SizedBox(
            height: 64,
            child: ElevatedButton.icon(
              onPressed: _onAddNewTap,
              icon: const Icon(Icons.add_circle_outline),
              label: const Text("Add Password"),
            ),
          ),
        )
      ],
    );
  }

  Widget _countSection() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blueGrey,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "100",
            style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          const SizedBox(width: 16.0),
          Flexible(
            child: Text(
              "Password Added",
              style: GoogleFonts.ubuntu(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
