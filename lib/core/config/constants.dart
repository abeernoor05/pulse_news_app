class Country {
  const Country(this.code, this.name);

  final String code; // lowercase ISO code, e.g. 'pk'
  final String name;

  // 'pk' -> 🇵🇰. Flag emojis are two "regional indicator" characters.
  String get flag => String.fromCharCodes(
    code.toUpperCase().codeUnits.map((c) => 0x1F1E6 + c - 0x41),
  );
}

class Language {
  const Language(this.code, this.name);

  final String code;
  final String name;
}

class AppRegions {
  AppRegions._();

  // Keep these in sync with what your chosen news API supports.
  static const countries = [
    Country('pk', 'Pakistan'),
    Country('in', 'India'),
    Country('bd', 'Bangladesh'),
    Country('us', 'United States'),
    Country('gb', 'United Kingdom'),
    Country('ca', 'Canada'),
    Country('au', 'Australia'),
    Country('ae', 'United Arab Emirates'),
    Country('sa', 'Saudi Arabia'),
    Country('eg', 'Egypt'),
    Country('tr', 'Türkiye'),
    Country('de', 'Germany'),
    Country('fr', 'France'),
    Country('es', 'Spain'),
    Country('it', 'Italy'),
    Country('br', 'Brazil'),
    Country('jp', 'Japan'),
    Country('cn', 'China'),
    Country('sg', 'Singapore'),
    Country('my', 'Malaysia'),
    Country('za', 'South Africa'),
    Country('ng', 'Nigeria'),
  ];

  static const languages = [
    Language('en', 'English'),
    Language('ur', 'Urdu'),
    Language('ar', 'Arabic'),
    Language('hi', 'Hindi'),
    Language('es', 'Spanish'),
    Language('fr', 'French'),
    Language('de', 'German'),
    Language('it', 'Italian'),
    Language('pt', 'Portuguese'),
    Language('zh', 'Chinese'),
    Language('ja', 'Japanese'),
    Language('ru', 'Russian'),
  ];

  // Stored codes -> full objects. Falls back to the first item if unknown.
  static Country country(String code) =>
      countries.firstWhere((c) => c.code == code, orElse: () => countries.first);

  static Language language(String code) =>
      languages.firstWhere((l) => l.code == code, orElse: () => languages.first);
}