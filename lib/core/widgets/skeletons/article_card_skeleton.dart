// article_card_skeleton.dart: placeholder
import 'package:flutter/material.dart';
import '../../theme/app_spacing.dart';
import 'skeleton_box.dart';

class ArticleCardSkeleton extends StatelessWidget {
  const ArticleCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: Spacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonBox(width: 60, height: 12),
                SizedBox(height: Spacing.sm),
                SkeletonBox(height: 16),
                SizedBox(height: Spacing.xs),
                SkeletonBox(height: 16),
                SizedBox(height: Spacing.xs),
                SkeletonBox(width: 140, height: 16),
                SizedBox(height: Spacing.sm),
                SkeletonBox(width: 120, height: 12),
              ],
            ),
          ),
          SizedBox(width: Spacing.md),
          SkeletonBox(width: 96, height: 96),
        ],
      ),
    );
  }
}