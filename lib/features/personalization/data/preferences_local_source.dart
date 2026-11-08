import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/user_preferences.dart';

// The only class that knows HOW preferences are stored (as a JSON string).
class PreferencesLocalSource {
  PreferencesLocalSource(this._prefs);

  final SharedPreferences _prefs;

  // The "_v1" lets us change the format later without crashing on old data.
  static const _key = 'user_preferences_v1';

  UserPreferences? read() {
    final raw = _prefs.getString(_key);
    if (raw == null) return null; // nothing saved yet

    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      return UserPreferences.fromJson(json);
    } catch (_) {
      return null; // corrupted data: behave like a first launch
    }
  }

  Future<void> write(UserPreferences preferences) {
    return _prefs.setString(_key, jsonEncode(preferences.toJson()));
  }
}