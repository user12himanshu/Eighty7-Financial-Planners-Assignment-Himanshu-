import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeUtils {
  static const primaryColor = Color(0xff0D253C);
  static const secondryColor = Color(0xff376AED);
  static const scaffoldBackgroundColor = Color(0xffF4F7FF);
  static const shadowColor = Color.fromRGBO(82, 130, 255, 0.06);

  TextStyle displayMedium = GoogleFonts.lato(
      fontSize: 20, fontWeight: FontWeight.w800, color: primaryColor);

  TextStyle displaySmall = GoogleFonts.lato(
      fontSize: 18, fontWeight: FontWeight.w800, color: primaryColor);

  TextStyle displayLarge = GoogleFonts.lato(
      fontSize: 24, fontWeight: FontWeight.w800, color: primaryColor);

  TextStyle titleMedium = GoogleFonts.lato(
      fontSize: 14, color: primaryColor, fontWeight: FontWeight.w500);

  TextStyle titleSmall = GoogleFonts.lato(
      fontSize: 12, color: primaryColor, fontWeight: FontWeight.w500);

  TextStyle headlineMedium = GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.w800, color: secondryColor);

  TextStyle bodyMedium = GoogleFonts.lato(
      fontWeight: FontWeight.w400, fontSize: 14, color: primaryColor);

  static const double defaultHorizontalPadding = 40;
  static const double defaultBorderRadius = 16;
}
