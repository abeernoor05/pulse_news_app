import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/progress_header.dart';

// Every onboarding step has the same skeleton:
// progress header, title, subtitle, content, sticky bottom button.
class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({
    super.key,
    required this.step,
    required this.title,
    required this.child,
    required this.buttonLabel,
    required this.onContinue,
    this.subtitle,
  });

  static const totalSteps = 4;

  final int step;
  final String title;
  final String? subtitle;
  final Widget child;
  final String buttonLabel;
  final VoidCallback? onContinue; // null = button disabled

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProgressHeader(
              step: step,
              total: totalSteps,
              onBack: () {
                if (context.canPop()) context.pop();
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.screen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Spacing.lg),
                    Text(title, style: t.displayMedium),
                    if (subtitle != null) ...[
                      const SizedBox(height: Spacing.sm),
                      Text(
                        subtitle!,
                        style: t.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
                      ),
                    ],
                    const SizedBox(height: Spacing.xl),
                    child,
                    const SizedBox(height: Spacing.xl),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Spacing.screen),
              child: AppButton(label: buttonLabel, onPressed: onContinue),
            ),
          ],
        ),
      ),
    );
  }
}