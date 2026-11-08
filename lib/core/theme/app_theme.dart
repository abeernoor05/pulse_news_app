import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(AppColors.light, Brightness.light);
  static ThemeData get dark => _build(AppColors.dark, Brightness.dark);

  // One builder for both themes. Only the palette and brightness differ.
  static ThemeData _build(AppPalette c, Brightness brightness) {
    // ColorScheme is Flutter's standard set of color roles.
    // Built-in widgets read these roles, so we map our tokens onto them.
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.primary,
      onPrimary: c.onPrimary,
      primaryContainer: c.primaryContainer,
      onPrimaryContainer: c.primary,
      secondary: c.primary,
      onSecondary: c.onPrimary,
      error: c.error,
      onError: Colors.white,
      surface: c.background,                 // screen background
      onSurface: c.textPrimary,              // main text
      onSurfaceVariant: c.textSecondary,     // secondary text
      surfaceContainer: c.surface,           // cards, nav bar
      surfaceContainerHighest: c.surfaceVariant, // inputs, skeletons
      outline: c.divider,
      outlineVariant: c.divider,
    );

    // apply() paints our text color over every style in the text theme.
    final textTheme = AppTextStyles.textTheme.apply(
      bodyColor: c.textPrimary,
      displayColor: c.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.background,
      textTheme: textTheme,

      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        elevation: 0,
        scrolledUnderElevation: 0, // no tint when content scrolls beneath
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),

      dividerTheme: DividerThemeData(color: c.divider, thickness: 1, space: 1),

      // Primary button: 52 high, full-width by default, pill-shaped.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: const StadiumBorder(),
          textStyle: textTheme.labelLarge,
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: c.surface,
        selectedColor: c.primary,
        shape: const StadiumBorder(),
        side: BorderSide.none,
      ),

      // Text fields (search bar): filled pill, no outline.
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surfaceVariant,
        hintStyle: textTheme.bodyLarge?.copyWith(color: c.textSecondary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Spacing.lg,
          vertical: Spacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Radii.pill),
          borderSide: BorderSide.none,
        ),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Radii.sheet),
          ),
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        backgroundColor: c.surface,
        elevation: 0,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(color: selected ? c.primary : c.textSecondary);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return textTheme.labelSmall?.copyWith(
            color: selected ? c.primary : c.textSecondary,
          );
        }),
      ),
    );
  }
}