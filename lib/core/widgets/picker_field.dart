import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class PickerField extends StatelessWidget {
  const PickerField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.leading,
  });

  final String label;     // small caption above the field
  final String value;     // currently chosen item
  final String? leading;  // e.g. a flag emoji
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall
              ?.copyWith(color: scheme.onSurfaceVariant),
        ),
        const SizedBox(height: Spacing.xs),
        Material(
          color: scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(Radii.card),
          child: InkWell(
            borderRadius: BorderRadius.circular(Radii.card),
            onTap: onTap,
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
              child: Row(
                children: [
                  if (leading != null) ...[
                    Text(leading!, style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: Spacing.md),
                  ],
                  Expanded(child: Text(value, style: theme.textTheme.bodyLarge)),
                  Icon(Icons.keyboard_arrow_down, color: scheme.onSurfaceVariant),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}