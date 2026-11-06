import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

@freezed
abstract class Article with _$Article {
  const factory Article({
    required String id,
    required String title,
    required String sourceName,
    required String url,
    required DateTime publishedAt,
    String? description,
    String? content,
    String? imageUrl,
    String? category,
  }) = _Article;
}