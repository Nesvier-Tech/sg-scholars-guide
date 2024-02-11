import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'scaffold_with_nav_bar.dart';
import 'temp/details_placeholder_screen.dart';
import 'temp/root_placeholder_screen.dart';

// TODO: [P3] Make a test for the AppRouter class.
/// Ref: https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter/
class AppRouter {
  const AppRouter._();

  // Private navigators.
  static final _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'sectionHomeNav');
  static final _shellNavigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'sectionProfileNav');

  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      // Stateful nested navigator.
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // First branch (home).
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: <RouteBase>[
              // Top route inside the home branch.
              GoRoute(
                path: '/home',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  // We use a NoTransitionPage inside said route to
                  // prevent unintended animations when switching between tabs
                  // (this is the default behaviour on popular iOS apps).
                  return const NoTransitionPage(
                    child: RootPlaceholderScreen(
                      label: 'Home',
                      detailsPath: '/home/details',
                    ),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsPlaceholderScreen(label: 'Home');
                    },
                  ),
                ],
              ),
            ],
          ),

          // Second branch (community).
          StatefulShellBranch(
            navigatorKey:
                GlobalKey<NavigatorState>(debugLabel: 'sectionCommunityNav'),
            routes: <RouteBase>[
              // Top route inside the community branch.
              GoRoute(
                path: '/community',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return const NoTransitionPage(
                    child: RootPlaceholderScreen(
                      label: 'Community',
                      detailsPath: '/community/details',
                    ),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsPlaceholderScreen(label: 'Community');
                    },
                  ),
                ],
              ),
            ],
          ),

          // Third branch (learn).
          StatefulShellBranch(
            navigatorKey:
                GlobalKey<NavigatorState>(debugLabel: 'sectionLearnNav'),
            routes: <RouteBase>[
              // Top route inside the learn branch.
              GoRoute(
                path: '/learn',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return const NoTransitionPage(
                    child: RootPlaceholderScreen(
                      label: 'Learn',
                      detailsPath: '/learn/details',
                    ),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsPlaceholderScreen(label: 'Learn');
                    },
                  ),
                ],
              ),
            ],
          ),

          // Fourth branch (profile).
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: <RouteBase>[
              // Top route inside the profile branch.
              GoRoute(
                path: '/profile',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return const NoTransitionPage(
                    child: RootPlaceholderScreen(
                      label: 'Profile',
                      detailsPath: '/profile/details',
                    ),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsPlaceholderScreen(label: 'Profile');
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
