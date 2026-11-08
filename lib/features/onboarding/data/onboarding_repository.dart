import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/storage/prefs_storage.dart';

class OnboardingRepository {
  OnboardingRepository(this._prefs);

  final SharedPreferences _prefs;
  static const _key = 'onboarding_completed';

  bool get isCompleted => _prefs.getBool(_key) ?? false;

  Future<void> markCompleted() => _prefs.setBool(_key, true);
}

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return OnboardingRepository(ref.watch(sharedPreferencesProvider));
});