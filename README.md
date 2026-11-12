# Pulse: a news app that adapts to who you are

[![CI](https://github.com/abeernoor05/pulse_news_app/actions/workflows/ci.yml/badge.svg)](https://github.com/abeernoor05/pulse_news_app/actions/workflows/ci.yml)
![Status](https://img.shields.io/badge/status-in%20development-orange)
![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)

> 🚧 **Work in progress.** This project is being built in public, phase by phase.
> The [roadmap](#roadmap) below shows what works today and what is coming next.

Most news apps show everyone the same feed. **Pulse** asks who you are
(a student, a working professional, a techie, or a general reader) and builds
a feed around that. Personas are mapped to topics and search keywords, because
news APIs don't have a "student" category.

## Current status

| Area | Status |
|---|---|
| Design system (colors, type scale, light/dark themes) | ✅ Done |
| Shared widgets (buttons, chips, article cards, skeleton loaders) | ✅ Done |
| Persona → topics → API query mapping (unit tested) | ✅ Done |
| Local preference storage + Riverpod state | ✅ Done |
| Routing, bottom-nav shell, onboarding redirect | ✅ Done |
| Onboarding flow (persona, topics, region, language) | ✅ Done |
| News API layer + repository | 🔨 Next |
| Home feed (For You / Top Headlines, pagination, pull-to-refresh) | ⏳ Planned |
| Article detail, in-app browser, share | ⏳ Planned |
| Search with debounce and recent searches | ⏳ Planned |
| Bookmarks and read later | ⏳ Planned |
| Offline caching, mute sources/topics | ⏳ Planned |
| Settings (edit persona, region, appearance) | ⏳ Planned |
| Firebase auth + cross-device sync | ⏳ Planned |
| Daily digest notification (FCM + local notifications) | ⏳ Planned |
| Text-to-speech "listen to article" | ⏳ Planned |

## Roadmap

- [x] **Phase 0:** Project setup, CI, theme, shared widgets
- [x] **Phase 1:** Personalization core, storage, routing, onboarding
- [ ] **Phase 2:** News API, feed, article detail, search, bookmarks
- [ ] **Phase 3:** Offline cache, muting, settings
- [ ] **Phase 4:** Firebase auth and sync
- [ ] **Phase 5:** Daily digest notifications and text-to-speech

## Tech stack

| Concern | Choice |
|---|---|
| Framework | Flutter (Dart) |
| State management | Riverpod |
| Navigation | go_router (stateful bottom-nav shell, redirect guard) |
| Networking | Dio |
| Models | freezed + json_serializable |
| Local storage | SharedPreferences (settings), Hive (cache and bookmarks, planned) |
| Backend (planned) | Firebase Auth, Firestore, FCM |
| CI | GitHub Actions (analyze + test on every push) |

## Architecture

Feature-first folders. Each feature owns its layers, and shared code lives in `core`.

```
lib/
├── core/            theme, router, network, storage, shared widgets
└── features/
    ├── onboarding/
    ├── personalization/   persona → topics → API query (the standout logic)
    ├── feed/
    ├── search/
    ├── saved/
    └── ...each with domain / data / application / presentation
```

Rules:
- `presentation` talks to `application` (Riverpod controllers), which talks to
  `domain` (models and repository interfaces). `data` implements those interfaces.
- UI never touches Dio or storage directly.
- The news provider sits behind a `NewsRepository` interface, so it can be swapped
  without touching screens.
- The app is **local-first**: it always reads and writes local storage, and cloud
  sync is layered on top when the user signs in.

## How personalization works

1. The user picks a persona. Each persona has default topics and a few "flavor"
   keywords (for example, Student adds `exams` and `scholarship`).
2. Topics with a matching API category (science, business) become category
   requests. Topics without one (education, careers) become keyword searches.
3. `PersonaMapper` combines both into a `FeedPlan`, with capped and
   de-duplicated keywords, which the repository turns into API calls.

See `lib/features/personalization/domain/` and its tests.

## Getting started

```bash
git clone https://github.com/abeernoor05/pulse_news_app.git
cd pulse_news_app
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

API keys are passed at build time and never committed (setup instructions will
be added with the news API phase).

```bash
flutter analyze
flutter test
```

## Screenshots

_Coming soon. Screenshots will be added to `docs/screenshots/` as screens are finished._

## License

TBD
