import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_button.dart';
import '../application/onboarding_controller.dart';
import 'widgets/onboarding_scaffold.dart';

class DigestSignInScreen extends ConsumerStatefulWidget {
  const DigestSignInScreen({super.key});

  @override
  ConsumerState<DigestSignInScreen> createState() => _DigestSignInScreenState();
}

class _DigestSignInScreenState extends ConsumerState<DigestSignInScreen> {
  bool _digestOn = true;
  TimeOfDay _time = const TimeOfDay(hour: 8, minute: 0);

  Future<void> _pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: _time);
    if (picked != null) setState(() => _time = picked);
  }

  void _comingSoon() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign-in arrives in a later update.')),
    );
  }

  // Both "Finish setup" and "Skip for now" end onboarding as a guest.
  Future<void> _finish() {
    return ref.read(onboardingControllerProvider.notifier).complete();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return OnboardingScaffold(
      step: 4,
      title: 'Almost done',
      subtitle: 'Both of these are optional and can be changed later.',
      buttonLabel: 'Finish setup',
      onContinue: _finish,
      child: Column(
        children: [
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Daily digest', style: t.titleMedium),
                  subtitle: const Text('A morning summary of your top stories'),
                  value: _digestOn,
                  onChanged: (value) => setState(() => _digestOn = value),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  enabled: _digestOn,
                  leading: const Icon(Icons.schedule),
                  title: const Text('Delivery time'),
                  trailing: Text(
                    _time.format(context),
                    style: t.labelLarge?.copyWith(
                      color: _digestOn ? scheme.primary : scheme.onSurfaceVariant,
                    ),
                  ),
                  onTap: _digestOn ? _pickTime : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: Spacing.lg),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sync across devices', style: t.titleMedium),
                const SizedBox(height: Spacing.xs),
                Text(
                  'Your bookmarks and preferences follow you to any phone.',
                  style: t.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
                ),
                const SizedBox(height: Spacing.lg),
                AppButton(
                  label: 'Continue with Google',
                  icon: Icons.login,
                  onPressed: _comingSoon,
                ),
                const SizedBox(height: Spacing.sm),
                AppButton(
                  label: 'Continue with Email',
                  icon: Icons.mail_outline,
                  variant: AppButtonVariant.secondary,
                  onPressed: _comingSoon,
                ),
                const SizedBox(height: Spacing.xs),
                AppButton(
                  label: 'Skip for now',
                  variant: AppButtonVariant.ghost,
                  onPressed: _finish,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// A flat card: surface fill and a 1px divider border, as in the design.
class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: scheme.surfaceContainer,
        borderRadius: BorderRadius.circular(Radii.card),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: child,
    );
  }
}