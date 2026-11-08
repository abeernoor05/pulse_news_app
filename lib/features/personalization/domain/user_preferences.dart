import 'package:freezed_annotation/freezed_annotation.dart';
import 'persona.dart';
import 'topic.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

@freezed
abstract class UserPreferences with _$UserPreferences {
  // Needed because we add our own getters/methods below.
  const UserPreferences._();

  const factory UserPreferences({
    required Persona persona,
    required Set<Topic> topics,
    @Default('pk') String countryCode,
    @Default('en') String languageCode,
  }) = _UserPreferences;

  // New user, or user who just picked a persona: start from its defaults.
  factory UserPreferences.forPersona(Persona persona) =>
      UserPreferences(persona: persona, topics: persona.defaultTopics.toSet());

  factory UserPreferences.initial() =>
      UserPreferences.forPersona(Persona.general);

  // Lets us save to / load from local storage as JSON.
  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);

  static const minTopics = 3;

  bool get hasEnoughTopics => topics.length >= minTopics;

  // Add the topic if missing, remove it if present. Returns a NEW object.
  UserPreferences toggleTopic(Topic topic) {
    final next = {...topics};
    if (!next.remove(topic)) next.add(topic);
    return copyWith(topics: next);
  }
}