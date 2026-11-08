// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    _UserPreferences(
      persona: $enumDecode(_$PersonaEnumMap, json['persona']),
      topics: (json['topics'] as List<dynamic>)
          .map((e) => $enumDecode(_$TopicEnumMap, e))
          .toSet(),
      countryCode: json['countryCode'] as String? ?? 'pk',
      languageCode: json['languageCode'] as String? ?? 'en',
    );

Map<String, dynamic> _$UserPreferencesToJson(_UserPreferences instance) =>
    <String, dynamic>{
      'persona': _$PersonaEnumMap[instance.persona]!,
      'topics': instance.topics.map((e) => _$TopicEnumMap[e]!).toList(),
      'countryCode': instance.countryCode,
      'languageCode': instance.languageCode,
    };

const _$PersonaEnumMap = {
  Persona.student: 'student',
  Persona.professional: 'professional',
  Persona.techie: 'techie',
  Persona.general: 'general',
  Persona.custom: 'custom',
};

const _$TopicEnumMap = {
  Topic.education: 'education',
  Topic.science: 'science',
  Topic.careers: 'careers',
  Topic.technology: 'technology',
  Topic.health: 'health',
  Topic.sports: 'sports',
  Topic.business: 'business',
  Topic.world: 'world',
  Topic.entertainment: 'entertainment',
  Topic.politics: 'politics',
  Topic.environment: 'environment',
  Topic.finance: 'finance',
};
