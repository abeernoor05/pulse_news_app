import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/onboarding_repository.dart';

// State is a bool: has the user finished onboarding?
class OnboardingController extends Notifier<bool> {
  @override
  bool build() => ref.watch(onboardingRepositoryProvider).isCompleted;

  Future<void> complete() async {
    await ref.read(onboardingRepositoryProvider).markCompleted();
    state = true; // the router is listening, so it redirects to Home
  }

  Future<void> reset() async {
    await ref.read(onboardingRepositoryProvider).reset();
    state = false;
  }
}

final onboardingControllerProvider =
NotifierProvider<OnboardingController, bool>(OnboardingController.new);