import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/persona_card.dart';
import '../../personalization/application/preferences_controller.dart';
import '../../personalization/domain/persona.dart';
import 'widgets/onboarding_icons.dart';
import 'widgets/onboarding_scaffold.dart';

class PersonaScreen extends ConsumerStatefulWidget {
  const PersonaScreen({super.key});

  @override
  ConsumerState<PersonaScreen> createState() => _PersonaScreenState();
}

class _PersonaScreenState extends ConsumerState<PersonaScreen> {
  // Local to this screen: null until the user taps a card.
  Persona? _selected;

  void _continue() {
    ref.read(preferencesControllerProvider.notifier).selectPersona(_selected!);
    context.push(Routes.topics);
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      step: 1,
      title: 'Who are you reading as?',
      subtitle: "We'll tailor your feed. You can change this anytime.",
      buttonLabel: 'Continue',
      onContinue: _selected == null ? null : _continue,
      child: Column(
        children: [
          for (final persona in Persona.values)
            Padding(
              padding: const EdgeInsets.only(bottom: Spacing.md),
              child: PersonaCard(
                icon: iconForPersona(persona),
                title: persona.label,
                description: persona.description,
                selected: _selected == persona,
                onTap: () => setState(() => _selected = persona),
              ),
            ),
        ],
      ),
    );
  }
}// persona_screen.dart: placeholder
