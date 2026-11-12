import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              AppButton(
                label: 'Get started',
                onPressed: () => context.push(Routes.persona),
              ),
            ],
          ),
        ),
      ),
    );
  }
}