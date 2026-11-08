import 'user_preferences.dart';

// What to ask the news API for. Kept separate from any specific API.
class FeedPlan {
  const FeedPlan({required this.categories, required this.keywords});

  final List<String> categories; // e.g. ['science', 'technology']
  final List<String> keywords;   // e.g. ['exams', 'scholarship', ...]

  bool get isEmpty => categories.isEmpty && keywords.isEmpty;

  // 'exams OR scholarship OR "industry trends"'
  // Multi-word phrases get quotes so they're searched as a phrase.
  String? get keywordQuery {
    if (keywords.isEmpty) return null;
    return keywords.map((k) => k.contains(' ') ? '"$k"' : k).join(' OR ');
  }
}

class PersonaMapper {
  PersonaMapper._();

  // Long queries get rejected or ignored by APIs, so we cap the keywords.
  static const maxKeywords = 8;

  static FeedPlan planFor(UserPreferences prefs) {
    // Sort by enum order so the same input always gives the same output.
    final topics = prefs.topics.toList()
      ..sort((a, b) => a.index.compareTo(b.index));

    final categories = <String>{};
    // Persona flavor goes first so it survives the cap below.
    final keywords = <String>{...prefs.persona.extraKeywords};

    for (final topic in topics) {
      final category = topic.apiCategory;
      if (category != null) categories.add(category);
      keywords.addAll(topic.keywords);
    }

    return FeedPlan(
      categories: categories.toList(),
      keywords: keywords.take(maxKeywords).toList(),
    );
  }
}