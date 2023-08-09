import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {

  // Colors
  static const colorBlue = Color.fromRGBO(44, 48, 121, 1.0);
  static const colorLiteBlue = Color.fromRGBO(71, 78, 197, 1.0);
  static const colorPurple = Color.fromRGBO(121, 82, 135, 1.0);
  static const colorLitePurple = Color.fromRGBO(189, 128, 211, 1.0);

  // assets
  static const imgBackground = "assets/background.png";
  static const imgLogo = "assets/logo.png";
  static const imgLogoBanner = "assets/logo_banner.png";

  // text styles
  static TextStyle textStyleTitle = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 28,
    ),
  );
}