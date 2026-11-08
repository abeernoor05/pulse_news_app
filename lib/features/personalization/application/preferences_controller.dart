import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/preferences_repository.dart';
import '../domain/persona.dart';
import '../domain/topic.dart';
import '../domain/user_preferences.dart';

class PreferencesController extends Notifier<UserPreferences> {
  // Runs once to create the initial state.
  @override
  UserPreferences build() {
    return ref.watch(preferencesRepositoryProvider).load();
  }

  // Choosing a persona resets topics to its defaults,
  // but keeps the country and language already chosen.
  void selectPersona(Persona persona) {
    state = UserPreferences.forPersona(persona).copyWith(
      countryCode: state.countryCode,
      languageCode: state.languageCode,
    );
    _persist();
  }

  void toggleTopic(Topic topic) {
    state = state.toggleTopic(topic);
    _persist();
  }

  void setRegion({String? countryCode, String? languageCode}) {
    state = state.copyWith(
      countryCode: countryCode ?? state.countryCode,
      languageCode: languageCode ?? state.languageCode,
    );
    _persist();
  }

  void _persist() {
    ref.read(preferencesRepositoryProvider).save(state);
  }
}

final preferencesControllerProvider =
NotifierProvider<PreferencesController, UserPreferences>(
  PreferencesController.new,
);