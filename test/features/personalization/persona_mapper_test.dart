import 'package:flutter_test/flutter_test.dart';
import 'package:pulse_news_app/features/personalization/domain/persona.dart';
import 'package:pulse_news_app/features/personalization/domain/persona_mapper.dart';
import 'package:pulse_news_app/features/personalization/domain/topic.dart';
import 'package:pulse_news_app/features/personalization/domain/user_preferences.dart';

void main() {
  group('PersonaMapper', () {
    test('student defaults include science category and scholarship keyword', () {
      final prefs = UserPreferences.forPersona(Persona.student);
      final plan = PersonaMapper.planFor(prefs);

      expect(plan.categories, containsAll(['science', 'technology', 'health']));
      expect(plan.keywords, contains('scholarship'));
    });

    test('custom persona with no topics gives an empty plan', () {
      final prefs = UserPreferences.forPersona(Persona.custom);
      expect(PersonaMapper.planFor(prefs).isEmpty, isTrue);
    });

    test('keywords are capped and have no duplicates', () {
      final prefs = UserPreferences(
        persona: Persona.techie,
        topics: Topic.values.toSet(), // every topic
      );
      final keywords = PersonaMapper.planFor(prefs).keywords;

      expect(keywords.length, lessThanOrEqualTo(PersonaMapper.maxKeywords));
      expect(keywords.toSet().length, keywords.length);
      expect(keywords.first, 'AI'); // persona flavor comes first
    });

    test('keywordQuery quotes multi-word phrases', () {
      final prefs = UserPreferences.forPersona(Persona.professional);
      final query = PersonaMapper.planFor(prefs).keywordQuery;

      expect(query, contains('"industry trends"'));
      expect(query, contains(' OR '));
    });
  });

  group('UserPreferences', () {
    test('toggleTopic adds then removes', () {
      final start = UserPreferences.forPersona(Persona.custom);
      final added = start.toggleTopic(Topic.sports);
      final removed = added.toggleTopic(Topic.sports);

      expect(added.topics, {Topic.sports});
      expect(removed.topics, isEmpty);
      expect(start.topics, isEmpty); // original never changes
    });

    test('hasEnoughTopics needs at least 3', () {
      final prefs = UserPreferences.forPersona(Persona.custom);
      expect(prefs.hasEnoughTopics, isFalse);
      expect(UserPreferences.forPersona(Persona.student).hasEnoughTopics, isTrue);
    });

    test('survives a JSON round trip', () {
      final original = UserPreferences.forPersona(Persona.techie);
      final copy = UserPreferences.fromJson(original.toJson());
      expect(copy, original); // freezed gives us value equality
    });
  });
}