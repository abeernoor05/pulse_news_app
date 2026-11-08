import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulse_news_app/core/storage/prefs_storage.dart';
import 'package:pulse_news_app/features/personalization/application/preferences_controller.dart';
import 'package:pulse_news_app/features/personalization/domain/persona.dart';
import 'package:pulse_news_app/features/personalization/domain/topic.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<ProviderContainer> makeContainer() async {
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('new user starts with the General persona', () async {
    final container = await makeContainer();
    expect(container.read(preferencesControllerProvider).persona, Persona.general);
  });

  test('selecting a persona loads its default topics', () async {
    final container = await makeContainer();
    container.read(preferencesControllerProvider.notifier).selectPersona(Persona.student);

    final state = container.read(preferencesControllerProvider);
    expect(state.persona, Persona.student);
    expect(state.topics, contains(Topic.education));
  });

  test('changes are saved and survive an app restart', () async {
    final first = await makeContainer();
    final controller = first.read(preferencesControllerProvider.notifier);
    controller.selectPersona(Persona.techie);
    controller.setRegion(countryCode: 'us');
    await Future<void>.delayed(Duration.zero); // let the write finish

    // A second container = a fresh app launch reading the same storage.
    final second = await makeContainer();
    final state = second.read(preferencesControllerProvider);
    expect(state.persona, Persona.techie);
    expect(state.countryCode, 'us');
  });
}