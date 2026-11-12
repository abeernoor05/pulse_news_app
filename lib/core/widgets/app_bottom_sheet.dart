import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

// Opens a sheet with a search box and a list. Returns the tapped item,
// or null if the user dismisses the sheet.
Future<T?> showPickerSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  required String Function(T item) labelOf,
  required bool Function(T item) isSelected,
  String Function(T item)? leadingOf,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true, // lets the sheet grow taller than half the screen
    builder: (_) => _PickerSheet<T>(
      title: title,
      items: items,
      labelOf: labelOf,
      isSelected: isSelected,
      leadingOf: leadingOf,
    ),
  );
}

class _PickerSheet<T> extends StatefulWidget {
  const _PickerSheet({
    required this.title,
    required this.items,
    required this.labelOf,
    required this.isSelected,
    this.leadingOf,
  });

  final String title;
  final List<T> items;
  final String Function(T item) labelOf;
  final bool Function(T item) isSelected;
  final String Function(T item)? leadingOf;

  @override
  State<_PickerSheet<T>> createState() => _PickerSheetState<T>();
}

class _PickerSheetState<T> extends State<_PickerSheet<T>> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final q = _query.trim().toLowerCase();
    final shown = widget.items
        .where((item) => widget.labelOf(item).toLowerCase().contains(q))
        .toList();

    return Padding(
      // Lifts the sheet above the keyboard.
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.screen),
              child: Text(widget.title, style: theme.textTheme.titleLarge),
            ),
            const SizedBox(height: Spacing.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.screen),
              child: TextField(
                onChanged: (value) => setState(() => _query = value),
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: Spacing.sm),
            Expanded(
              child: ListView.builder(
                itemCount: shown.length,
                itemBuilder: (context, index) {
                  final item = shown[index];
                  final leading = widget.leadingOf?.call(item);
                  return ListTile(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: Spacing.screen),
                    leading: leading == null
                        ? null
                        : Text(leading, style: const TextStyle(fontSize: 24)),
                    title: Text(widget.labelOf(item)),
                    trailing: widget.isSelected(item)
                        ? Icon(Icons.check, color: theme.colorScheme.primary)
                        : null,
                    onTap: () => Navigator.of(context).pop(item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}