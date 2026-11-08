import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/prefs_storage.dart';
import '../domain/user_preferences.dart';
import 'preferences_local_source.dart';

class PreferencesRepository {
  PreferencesRepository(this._source);

  final PreferencesLocalSource _source;

  // Saved preferences, or sensible defaults for a brand-new user.
  UserPreferences load() => _source.read() ?? UserPreferences.initial();

  Future<void> save(UserPreferences preferences) => _source.write(preferences);
}

final preferencesRepositoryProvider = Provider<PreferencesRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return PreferencesRepository(PreferencesLocalSource(prefs));
});