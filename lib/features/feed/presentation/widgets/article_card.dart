import 'package:flutter/material.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/article_image.dart';
import '../../../../core/widgets/source_avatar.dart';
import '../../domain/article.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
    this.onTap,
    this.onMenuTap,
  });

  final Article article;
  final VoidCallback? onTap;      // open the article
  final VoidCallback? onMenuTap;  // open the ⋯ sheet

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final category = article.category;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Radii.card),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side takes all the width the image doesn't need.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (category != null) ...[
                    Text(
                      category.toUpperCase(),
                      style: theme.textTheme.labelSmall
                          ?.copyWith(color: scheme.primary),
                    ),
                    const SizedBox(height: Spacing.xs),
                  ],
                  Text(
                    article.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: Spacing.sm),
                  Row(
                    children: [
                      SourceAvatar(name: article.sourceName),
                      const SizedBox(width: Spacing.sm),
                      Expanded(
                        child: Text(
                          '${article.sourceName} · ${timeAgo(article.publishedAt)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelSmall
                              ?.copyWith(color: scheme.onSurfaceVariant),
                        ),
                      ),
                      InkResponse(
                        onTap: onMenuTap,
                        radius: 20,
                        child: Icon(
                          Icons.more_horiz,
                          size: 20,
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: Spacing.md),
            ClipRRect(
              borderRadius: BorderRadius.circular(Radii.image),
              child: ArticleImage(url: article.imageUrl, width: 96, height: 96),
            ),
          ],
        ),
      ),
    );
  }
}