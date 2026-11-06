import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({super.key, required this.url, this.width, this.height});

  final String? url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fill = scheme.surfaceContainerHighest;

    // Shown when there's no image, or it fails to load.
    final fallback = Container(
      width: width,
      height: height,
      color: fill,
      alignment: Alignment.center,
      child: Icon(Icons.image_outlined, color: scheme.onSurfaceVariant),
    );

    final address = url;
    if (address == null || address.isEmpty) return fallback;

    return CachedNetworkImage(
      imageUrl: address,
      width: width,
      height: height,
      fit: BoxFit.cover, // crop to fill the box
      placeholder: (context, _) => Container(width: width, height: height, color: fill),
      errorWidget: (context, _, __) => fallback,
    );
  }
}