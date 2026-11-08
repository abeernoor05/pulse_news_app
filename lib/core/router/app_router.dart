import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/feed/presentation/home_screen.dart';
import '../../features/onboarding/application/onboarding_controller.dart';
import '../../features/onboarding/presentation/welcome_screen.dart';
import '../../features/saved/presentation/saved_screen.dart';
import '../../features/search/presentation/search_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import 'routes.dart';
import 'shell_scaffold.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // GoRouter can't watch Riverpod directly. This notifier is the bridge:
  // when onboarding state changes, we poke it, and GoRouter re-runs redirect.
  final refresh = ValueNotifier<bool>(ref.read(onboardingControllerProvider));
  ref.listen<bool>(
    onboardingControllerProvider,
        (_, next) => refresh.value = next,
  );
  ref.onDispose(refresh.dispose);

  final router = GoRouter(
    initialLocation: Routes.home,
    refreshListenable: refresh,

    // Runs before every navigation. Return a path to redirect, or null to allow.
    redirect: (context, state) {
      final done = ref.read(onboardingControllerProvider);
      final inOnboarding = state.matchedLocation.startsWith(Routes.onboarding);

      if (!done && !inOnboarding) return Routes.welcome; // new user
      if (done && inOnboarding) return Routes.home;      // already onboarded
      return null;
    },

    routes: [
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),

      // The 4 tabs. Each branch is its own navigation stack.
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ShellScaffold(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.search,
              builder: (context, state) => const SearchScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.saved,
              builder: (context, state) => const SavedScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
          ]),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
});