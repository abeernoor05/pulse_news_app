import 'package:flutter/material.dart';

class SourceAvatar extends StatelessWidget {
  const SourceAvatar({
    super.key,
    required this.name,
    this.size = 20,
  });

  final String name;   // e.g. "BBC News"
  final double size;   // diameter of the circle

  // "BBC News" -> "BB", "CNN" -> "CN", "" -> "?"
  String get _initials {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return '?';
    final words = trimmed.split(RegExp(r'\s+'));
    if (words.length == 1) {
      return trimmed.substring(0, trimmed.length >= 2 ? 2 : 1).toUpperCase();
    }
    return (words[0][0] + words[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: Text(
        _initials,
        style: TextStyle(
          fontSize: size * 0.4,
          fontWeight: FontWeight.w700,
          color: scheme.primary,
        ),
      ),
    );
  }
}