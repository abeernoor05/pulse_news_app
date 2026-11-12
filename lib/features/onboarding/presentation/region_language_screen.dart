import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/config/constants.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_bottom_sheet.dart';
import '../../../core/widgets/picker_field.dart';
import '../../personalization/application/preferences_controller.dart';
import 'widgets/onboarding_scaffold.dart';

class RegionLanguageScreen extends ConsumerWidget {
  const RegionLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesControllerProvider);
    final controller = ref.read(preferencesControllerProvider.notifier);

    final country = AppRegions.country(prefs.countryCode);
    final language = AppRegions.language(prefs.languageCode);

    return OnboardingScaffold(
      step: 3,
      title: 'Where and how do you read?',
      subtitle: 'We use this to pick local stories in your language.',
      buttonLabel: 'Continue',
      onContinue: () => context.push(Routes.digest),
      child: Column(
        children: [
          PickerField(
            label: 'Country',
            value: country.name,
            leading: country.flag,
            onTap: () async {
              final picked = await showPickerSheet<Country>(
                context: context,
                title: 'Choose your country',
                items: AppRegions.countries,
                labelOf: (c) => c.name,
                leadingOf: (c) => c.flag,
                isSelected: (c) => c.code == country.code,
              );
              if (picked != null) controller.setRegion(countryCode: picked.code);
            },
          ),
          const SizedBox(height: Spacing.lg),
          PickerField(
            label: 'Language',
            value: language.name,
            onTap: () async {
              final picked = await showPickerSheet<Language>(
                context: context,
                title: 'Choose your language',
                items: AppRegions.languages,
                labelOf: (l) => l.name,
                isSelected: (l) => l.code == language.code,
              );
              if (picked != null) controller.setRegion(languageCode: picked.code);
            },
          ),
        ],
      ),
    );
  }
}