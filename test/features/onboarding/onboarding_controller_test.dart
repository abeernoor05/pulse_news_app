import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulse_news_app/core/storage/prefs_storage.dart';
import 'package:pulse_news_app/features/onboarding/application/onboarding_controller.dart';
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

  test('new user has not completed onboarding', () async {
    final container = await makeContainer();
    expect(container.read(onboardingControllerProvider), isFalse);
  });

  test('complete() flips the state and is remembered', () async {
    final first = await makeContainer();
    await first.read(onboardingControllerProvider.notifier).complete();
    expect(first.read(onboardingControllerProvider), isTrue);

    final second = await makeContainer(); // simulates an app restart
    expect(second.read(onboardingControllerProvider), isTrue);
  });

  test('reset() puts the user back at the start', () async {
    final container = await makeContainer();
    final controller = container.read(onboardingControllerProvider.notifier);
    await controller.complete();
    await controller.reset();
    expect(container.read(onboardingControllerProvider), isFalse);
  });
}