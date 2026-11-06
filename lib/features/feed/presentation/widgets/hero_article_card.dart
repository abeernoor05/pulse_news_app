import 'package:flutter/material.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_chip.dart';
import '../../../../core/widgets/article_image.dart';
import '../../../../core/widgets/source_avatar.dart';
import '../../domain/article.dart';

class HeroArticleCard extends StatelessWidget {
  const HeroArticleCard({
    super.key,
    required this.article,
    this.isBookmarked = false,
    this.onTap,
    this.onBookmarkTap,
  });

  final Article article;
  final bool isBookmarked;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final category = article.category;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Radii.hero),
        child: SizedBox(
          height: 220,
          child: Stack(
            fit: StackFit.expand, // every child fills the whole card
            children: [
              ArticleImage(url: article.imageUrl),

              // Transparent at the top, dark at the bottom, so white text is readable.
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xCC000000)],
                    stops: [0.3, 1],
                  ),
                ),
              ),

              if (category != null)
                Positioned(
                  top: Spacing.md,
                  left: Spacing.md,
                  child: AppChip(label: category, selected: true),
                ),

              Positioned(
                top: Spacing.xs,
                right: Spacing.xs,
                child: IconButton(
                  onPressed: onBookmarkTap,
                  color: Colors.white,
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  ),
                ),
              ),

              Positioned(
                left: Spacing.lg,
                right: Spacing.lg,
                bottom: Spacing.lg,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleLarge?.copyWith(color: Colors.white),
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
                            style: textTheme.labelSmall
                                ?.copyWith(color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}