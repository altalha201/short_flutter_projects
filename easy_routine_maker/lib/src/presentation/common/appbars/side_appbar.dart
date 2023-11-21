import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideAppbar extends StatelessWidget {
  const SideAppbar({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue,
            Colors.blue,
            Colors.blueAccent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.horizontal(
          right: Radius.elliptical(64, 64),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 0),
            blurRadius: 8,
            spreadRadius: 0,
            color: Colors.black54,
          )
        ],
      ),
      alignment: Alignment.center,
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          title,
          style: GoogleFonts.merienda(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}