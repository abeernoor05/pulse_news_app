import 'package:flutter/material.dart';
import '../../../personalization/domain/persona.dart';
import '../../../personalization/domain/topic.dart';

IconData iconForPersona(Persona persona) => switch (persona) {
  Persona.student => Icons.school_outlined,
  Persona.professional => Icons.work_outline,
  Persona.techie => Icons.code,
  Persona.general => Icons.public,
  Persona.custom => Icons.tune,
};

IconData iconForTopic(Topic topic) => switch (topic) {
  Topic.education => Icons.school_outlined,
  Topic.science => Icons.science_outlined,
  Topic.careers => Icons.work_outline,
  Topic.technology => Icons.memory,
  Topic.health => Icons.favorite_border,
  Topic.sports => Icons.sports_soccer,
  Topic.business => Icons.business_center_outlined,
  Topic.world => Icons.public,
  Topic.entertainment => Icons.movie_outlined,
  Topic.politics => Icons.account_balance_outlined,
  Topic.environment => Icons.eco_outlined,
  Topic.finance => Icons.trending_up,
};