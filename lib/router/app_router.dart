import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scholars_guide/core/features/auth/presentation/screens/signup_screen.dart';

import '../core/features/auth/presentation/screens/forgot_password_screen.dart';
import '../core/features/auth/presentation/screens/login_screen.dart';
import '../core/features/auth/presentation/screens/password_reset_email_sent_confirmation_screen.dart';
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
  static final _shellNavigatorCommunityKey =
      GlobalKey<NavigatorState>(debugLabel: 'sectionCommunityNav');
  static final _shellNavigatorLearnKey =
      GlobalKey<NavigatorState>(debugLabel: 'sectionLearnNav');
  static final _shellNavigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'sectionProfileNav');

  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      // AUTH.
      GoRoute(
        path: '/login',
        builder: (_, __) => const LoginScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'forgot-password',
            builder: (_, __) => const ForgotPasswordScreen(),
          ),
          GoRoute(
            path: 'password-reset-email-sent-confirmation',
            builder: (_, __) =>
                const PasswordResetEmailSentConfirmationScreen(),
          ),
        ],
      ),

      GoRoute(
        path: '/signup',
        builder: (_, __) => const SignupScreen(),
      ),

      // BOTTOM NAVIGATION.
      // Stateful nested navigator.
      StatefulShellRoute.indexedStack(
        builder: (_, __, StatefulNavigationShell navigationShell) {
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
                pageBuilder: (_, __) {
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
                    builder: (_, __) =>
                        const DetailsPlaceholderScreen(label: 'Home'),
                  ),
                ],
              ),
            ],
          ),

          // Second branch (community).
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCommunityKey,
            routes: <RouteBase>[
              // Top route inside the community branch.
              GoRoute(
                path: '/community',
                pageBuilder: (_, __) {
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
                    builder: (_, __) =>
                        const DetailsPlaceholderScreen(label: 'Community'),
                  ),
                ],
              ),
            ],
          ),

          // Third branch (learn).
          StatefulShellBranch(
            navigatorKey: _shellNavigatorLearnKey,
            routes: <RouteBase>[
              // Top route inside the learn branch.
              GoRoute(
                path: '/learn',
                pageBuilder: (_, __) {
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
                    builder: (_, __) =>
                        const DetailsPlaceholderScreen(label: 'Learn'),
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
                pageBuilder: (_, __) {
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
                    builder: (_, __) =>
                        const DetailsPlaceholderScreen(label: 'Profile'),
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
