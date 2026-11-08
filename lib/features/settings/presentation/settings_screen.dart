import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/app_button.dart';
import '../../onboarding/application/onboarding_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        // Temporary: lets you replay onboarding while developing.
        child: AppButton(
          label: 'Reset onboarding (dev)',
          variant: AppButtonVariant.secondary,
          onPressed: () =>
              ref.read(onboardingControllerProvider.notifier).reset(),
        ),
      ),
    );
  }
}