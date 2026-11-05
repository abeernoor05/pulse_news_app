import 'package:flutter/material.dart';

class AppPalette {
  const AppPalette({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.textPrimary,
    required this.textSecondary,
    required this.divider,
    required this.success,
    required this.warning,
    required this.error,
  });

  final Color primary;           // the one blue accent (buttons, selected chips)
  final Color onPrimary;         // text/icons that sit ON the blue (white)
  final Color primaryContainer;  // soft blue tint (selected cards, chip backgrounds)
  final Color background;        // screen background
  final Color surface;           // cards, bottom nav, sheets
  final Color surfaceVariant;    // search bar fill, skeleton blocks
  final Color textPrimary;       // headlines and body
  final Color textSecondary;     // metadata (source, time)
  final Color divider;           // 1px borders and lines
  final Color success;
  final Color warning;
  final Color error;
}

class AppColors {
  AppColors._();    //to block creating instances of this class

  static const light = AppPalette(
    primary: Color(0xFF1E6FF0),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE8F0FE),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF5F7FA),
    surfaceVariant: Color(0xFFEAEEF3),
    textPrimary: Color(0xFF0F172A),
    textSecondary: Color(0xFF64748B),
    divider: Color(0xFFE2E8F0),
    success: Color(0xFF16A34A),
    warning: Color(0xFFF59E0B),
    error: Color(0xFFDC2626),
  );

  static const dark = AppPalette(
    primary: Color(0xFF4C8DFF),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF16284A),
    background: Color(0xFF0B0F17),
    surface: Color(0xFF131A26),
    surfaceVariant: Color(0xFF1C2433),
    textPrimary: Color(0xFFF1F5F9),
    textSecondary: Color(0xFF94A3B8),
    divider: Color(0xFF243044),
    success: Color(0xFF4ADE80),
    warning: Color(0xFFFBBF24),
    error: Color(0xFFF87171),
  );
}