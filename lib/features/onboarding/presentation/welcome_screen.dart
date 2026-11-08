import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_button.dart';
import '../application/onboarding_controller.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.screen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text('News made for you', style: t.displayMedium),
              const SizedBox(height: Spacing.sm),
              Text(
                'Pick who you are and get a feed that matches your day.',
                style: t.bodyLarge,
              ),
              const SizedBox(height: Spacing.xl),
              // Temporary: later this goes to the Persona screen instead.
              AppButton(
                label: 'Get started',
                onPressed: () =>
                    ref.read(onboardingControllerProvider.notifier).complete(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}