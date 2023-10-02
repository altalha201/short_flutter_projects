import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingsHeader extends StatelessWidget {
  const GreetingsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Welcome Back",
          style: GoogleFonts.croissantOne(
            fontSize: 20,
            color: Colors.grey.shade800,
          ),
        ),
        Text(
          "Al Talha!",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.croissantOne(
            fontSize: 48,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 12.0),
          child: Divider(
            color: Colors.blueGrey.shade300,
            thickness: 1.6,
          ),
        )
      ],
    );
  }
}
