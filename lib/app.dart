import 'package:flutter/material.dart';
import 'core/theme/app_spacing.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/app_button.dart';
import 'core/widgets/app_chip.dart';
import 'core/widgets/source_avatar.dart';

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
      home: const _ThemePreview(),
    );
  }
}

class _ThemePreview extends StatelessWidget {
  const _ThemePreview();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Pulse')),
      body: ListView(
        padding: const EdgeInsets.all(Spacing.screen),
        children: [
          Text('Display 28 Bold', style: t.displayMedium),
          const SizedBox(height: Spacing.sm),
          Text('Title 22 Bold', style: t.titleLarge),
          const SizedBox(height: Spacing.sm),
          Text('Headline 18 SemiBold', style: t.titleMedium),
          const SizedBox(height: Spacing.sm),
          Text('Body 15 Regular, used for article text.', style: t.bodyLarge),
          const SizedBox(height: Spacing.lg),
          AppButton(label: 'Get started', onPressed: () {}),
          const SizedBox(height: Spacing.sm),
          AppButton(
            label: 'Skip',
            variant: AppButtonVariant.secondary,
            onPressed: () {},
          ),
          const SizedBox(height: Spacing.sm),
          AppButton(
            label: 'I already have an account',
            variant: AppButtonVariant.ghost,
            onPressed: () {},
          ),
          const SizedBox(height: Spacing.sm),
          const AppButton(label: 'Loading', onPressed: null, isLoading: true),
          const SizedBox(height: Spacing.lg),
          const Wrap(
            spacing: Spacing.sm,
            runSpacing: Spacing.sm,
            children: [
              AppChip(label: 'Technology'),
              AppChip(label: 'Education', selected: true, icon: Icons.school),
              AppChip(label: '#AI'),
            ],
          ),
          const SizedBox(height: Spacing.lg),
          const Row(
            children: [
              SourceAvatar(name: 'BBC News', size: 28),
              SizedBox(width: Spacing.sm),
              SourceAvatar(name: 'CNN'),
            ],
          ),
          const SizedBox(height: Spacing.lg),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search news',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}