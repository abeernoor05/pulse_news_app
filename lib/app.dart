import 'package:flutter/material.dart';
import 'core/theme/app_spacing.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/skeletons/article_card_skeleton.dart';
import 'features/feed/domain/article.dart';
import 'features/feed/presentation/widgets/article_card.dart';
import 'features/feed/presentation/widgets/hero_article_card.dart';

class PulseApp extends StatelessWidget {
  const PulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulse',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const _CardsPreview(),
    );
  }
}

class _CardsPreview extends StatelessWidget {
  const _CardsPreview();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final articles = [
      Article(
        id: '1',
        title: 'Universities expand scholarship programs for STEM students',
        sourceName: 'BBC News',
        url: 'https://example.com/1',
        publishedAt: now.subtract(const Duration(hours: 2)),
        imageUrl: 'https://picsum.photos/seed/pulse1/800/500',
        category: 'Education',
      ),
      Article(
        id: '2',
        title: 'New AI chip promises faster on-device language models',
        sourceName: 'CNN',
        url: 'https://example.com/2',
        publishedAt: now.subtract(const Duration(minutes: 40)),
        imageUrl: 'https://picsum.photos/seed/pulse2/300/300',
        category: 'Technology',
      ),
      Article(
        id: '3',
        title: 'Markets rally as inflation cools for a third straight month, '
            'with analysts expecting rate cuts to follow',
        sourceName: 'Reuters',
        url: 'https://example.com/3',
        publishedAt: now.subtract(const Duration(days: 1)),
        category: 'Business', // no image on purpose: tests the fallback
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Pulse')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.screen),
        children: [
          HeroArticleCard(article: articles[0], onTap: () {}, onBookmarkTap: () {}),
          const SizedBox(height: Spacing.sm),
          ArticleCard(article: articles[1], onTap: () {}, onMenuTap: () {}),
          ArticleCard(article: articles[2], onTap: () {}, onMenuTap: () {}),
          const Divider(),
          const ArticleCardSkeleton(),
          const ArticleCardSkeleton(),
        ],
      ),
    );
  }
}