import 'package:flutter_test/flutter_test.dart';
import 'package:pulse_news_app/core/config/constants.dart';

void main() {
  test('flag emoji is built from the country code', () {
    expect(const Country('pk', 'Pakistan').flag, '🇵🇰');
    expect(const Country('us', 'United States').flag, '🇺🇸');
  });

  test('unknown codes fall back instead of crashing', () {
    expect(AppRegions.country('zz').code, AppRegions.countries.first.code);
    expect(AppRegions.language('zz').code, 'en');
  });

  test('every country code is lowercase and two letters', () {
    for (final c in AppRegions.countries) {
      expect(c.code, matches(r'^[a-z]{2}$'));
    }
  });
}