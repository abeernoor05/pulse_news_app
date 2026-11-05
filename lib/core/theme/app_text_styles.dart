import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextTheme get textTheme => TextTheme(
    // Display 28 / Bold
    displayMedium: GoogleFonts.plusJakartaSans(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.25, // line height = 1.25 x font size
    ),
    // Title 22 / Bold
    titleLarge: GoogleFonts.plusJakartaSans(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.3,
    ),
    // Headline 18 / SemiBold (article titles in cards)
    titleMedium: GoogleFonts.plusJakartaSans(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    // Body 15 / Regular, line height 22 -> 22/15
    bodyLarge: GoogleFonts.plusJakartaSans(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 22 / 15,
    ),
    // Button 15 / SemiBold
    labelLarge: GoogleFonts.plusJakartaSans(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    // Caption 12 / Medium (source, time, category)
    labelSmall: GoogleFonts.plusJakartaSans(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );
}