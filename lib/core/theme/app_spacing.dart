// Spacing follows a 4pt grid, so every gap in the app comes from this list.
class Spacing {
  Spacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double screen = 20; // side padding on every screen
}

// Corner radii from the design: pill, card 16, hero 24, image 12, sheet 28.
class Radii {
  Radii._();

  static const double pill = 999; // large enough to look fully round
  static const double card = 16;
  static const double hero = 24;
  static const double image = 12;
  static const double sheet = 28;
}