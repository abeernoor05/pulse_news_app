// News APIs only have a few fixed categories (business, science, ...).
// Topics like "Education" have no category, so we describe them with keywords.
enum Topic {
  education('Education', keywords: ['education', 'university', 'scholarship']),
  science('Science', apiCategory: 'science'),
  careers('Careers', keywords: ['jobs', 'careers', 'internship']),
  technology('Technology', apiCategory: 'technology'),
  health('Health', apiCategory: 'health'),
  sports('Sports', apiCategory: 'sports'),
  business('Business', apiCategory: 'business'),
  world('World', apiCategory: 'world'),
  entertainment('Entertainment', apiCategory: 'entertainment'),
  politics('Politics', keywords: ['politics', 'government', 'election']),
  environment('Environment', keywords: ['climate', 'environment', 'sustainability']),
  finance('Finance', keywords: ['finance', 'economy', 'stock market']);

  const Topic(this.label, {this.apiCategory, this.keywords = const []});

  final String label;         // shown on chips
  final String? apiCategory;  // API category name, or null if there is none
  final List<String> keywords; // search words used when there's no category
}