import 'package:flutter/material.dart';
import 'core/theme/app_spacing.dart';
import 'core/theme/app_theme.dart';

class PulseApp extends StatelessWidget {
  const PulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulse',
      theme: AppTheme.light,          // used in light mode
      darkTheme: AppTheme.dark,       // used in dark mode
      themeMode: ThemeMode.system,    // follow the phone's setting
      debugShowCheckedModeBanner: false,
      home: const _ThemePreview(),    // temporary, we'll replace it with the router
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
          FilledButton(onPressed: () {}, child: const Text('Get started')),
          const SizedBox(height: Spacing.lg),
          Wrap(
            spacing: Spacing.sm,
            children: [
              const Chip(label: Text('Technology')),
              ChoiceChip(
                label: const Text('Education'),
                selected: true,
                onSelected: (_) {},
              ),
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