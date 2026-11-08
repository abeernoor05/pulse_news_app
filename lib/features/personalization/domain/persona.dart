import 'topic.dart';

enum Persona {
  student(
    label: 'Student',
    description: 'Education, science, careers',
    defaultTopics: [
      Topic.education,
      Topic.science,
      Topic.careers,
      Topic.technology,
      Topic.health,
    ],
    extraKeywords: ['exams', 'scholarship'],
  ),
  professional(
    label: 'Professional',
    description: 'Business, markets, productivity',
    defaultTopics: [
      Topic.business,
      Topic.finance,
      Topic.technology,
      Topic.world,
      Topic.careers,
    ],
    extraKeywords: ['productivity', 'industry trends'],
  ),
  techie(
    label: 'Techie',
    description: 'Tech, AI, startups',
    defaultTopics: [
      Topic.technology,
      Topic.science,
      Topic.business,
      Topic.entertainment,
    ],
    extraKeywords: ['AI', 'startups', 'open source'],
  ),
  general(
    label: 'General reader',
    description: 'Top stories and world news',
    defaultTopics: [
      Topic.world,
      Topic.politics,
      Topic.business,
      Topic.sports,
      Topic.entertainment,
    ],
  ),
  custom(
    label: 'Custom',
    description: 'Build your own mix',
    defaultTopics: [],
  );

  const Persona({
    required this.label,
    required this.description,
    required this.defaultTopics,
    this.extraKeywords = const [],
  });

  final String label;
  final String description;
  final List<Topic> defaultTopics;  // pre-selected on the Topics screen
  final List<String> extraKeywords; // the persona's "flavor", added to every query
}