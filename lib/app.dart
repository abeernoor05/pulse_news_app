import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_spacing.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/app_chip.dart';
import 'features/personalization/application/preferences_controller.dart';
import 'features/personalization/domain/persona.dart';
import 'features/personalization/domain/persona_mapper.dart';
import 'features/personalization/domain/topic.dart';

class PulseApp extends StatelessWidget {
  const PulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulse',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const _PreferencesPreview(),
    );
  }
}

class _PreferencesPreview extends ConsumerWidget {
  const _PreferencesPreview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch = rebuild this widget whenever preferences change
    final prefs = ref.watch(preferencesControllerProvider);
    final controller = ref.read(preferencesControllerProvider.notifier);
    final plan = PersonaMapper.planFor(prefs);
    final t = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Preferences test')),
      body: ListView(
        padding: const EdgeInsets.all(Spacing.screen),
        children: [
          Text('Persona', style: t.titleMedium),
          const SizedBox(height: Spacing.sm),
          Wrap(
            spacing: Spacing.sm,
            runSpacing: Spacing.sm,
            children: [
              for (final p in Persona.values)
                AppChip(
                  label: p.label,
                  selected: prefs.persona == p,
                  onTap: () => controller.selectPersona(p),
                ),
            ],
          ),
          const SizedBox(height: Spacing.xl),
          Text('Topics (${prefs.topics.length} selected)', style: t.titleMedium),
          const SizedBox(height: Spacing.sm),
          Wrap(
            spacing: Spacing.sm,
            runSpacing: Spacing.sm,
            children: [
              for (final topic in Topic.values)
                AppChip(
                  label: topic.label,
                  selected: prefs.topics.contains(topic),
                  onTap: () => controller.toggleTopic(topic),
                ),
            ],
          ),
          const SizedBox(height: Spacing.xl),
          Text('API plan', style: t.titleMedium),
          const SizedBox(height: Spacing.sm),
          Text('Categories: ${plan.categories.join(', ')}'),
          const SizedBox(height: Spacing.xs),
          Text('Keywords: ${plan.keywordQuery ?? '(none)'}'),
        ],
      ),
    );
  }
}