// topics_screen.dart: placeholder
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_chip.dart';
import '../../personalization/application/preferences_controller.dart';
import '../../personalization/domain/persona.dart';
import '../../personalization/domain/topic.dart';
import '../../personalization/domain/user_preferences.dart';
import 'widgets/onboarding_icons.dart';
import 'widgets/onboarding_scaffold.dart';

class TopicsScreen extends ConsumerWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesControllerProvider);
    final controller = ref.read(preferencesControllerProvider.notifier);
    final scheme = Theme.of(context).colorScheme;

    final subtitle = prefs.persona == Persona.custom
        ? 'Build your own mix. Tap to add or remove.'
        : 'Based on ${prefs.persona.label}. Tap to add or remove.';

    return OnboardingScaffold(
      step: 2,
      title: 'Pick your topics',
      subtitle: subtitle,
      buttonLabel: 'Continue',
      onContinue:
      prefs.hasEnoughTopics ? () => context.push(Routes.region) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: Spacing.sm,
            runSpacing: Spacing.sm,
            children: [
              for (final topic in Topic.values)
                AppChip(
                  label: topic.label,
                  icon: iconForTopic(topic),
                  selected: prefs.topics.contains(topic),
                  onTap: () => controller.toggleTopic(topic),
                ),
            ],
          ),
          const SizedBox(height: Spacing.lg),
          Text(
            '${prefs.topics.length} selected (min ${UserPreferences.minTopics})',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: scheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}