import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scholars_guide/features/profile/presentation/screens/view_questions_screen.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/finished_quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/ready_quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/solutions_quiz_page.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/pages/upload_questions_page.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/pages/upload_success_page.dart';

import '../core/features/auth/presentation/screens/email_verification_screen.dart';
import '../core/features/auth/presentation/screens/forgot_password_screen.dart';
import '../core/features/auth/presentation/screens/login_screen.dart';
import '../core/features/auth/presentation/screens/password_reset_email_sent_confirmation_screen.dart';
import '../core/features/auth/presentation/screens/signup_screen.dart';
import '../features/legalities/presentation/screens/privacy_policy_screen.dart';
import '../features/legalities/presentation/screens/terms_of_service_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
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
        routes: <RouteBase>[
          GoRoute(
            path: 'email-verification-sent',
            builder: (_, __) => const EmailVerificationSentScreen(),
          ),
        ],
      ),

      // LEGALITIES.
      GoRoute(
        path: '/privacy-policy',
        builder: (_, __) => PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: '/terms-of-service',
        builder: (_, __) => const TermsOfServiceScreen(),
      ),

      // BOTTOM NAVIGATION.
      // Stateful nested navigator.
      StatefulShellRoute.indexedStack(
        builder: (_, __, StatefulNavigationShell navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // // First branch (home).
          // StatefulShellBranch(
          //   navigatorKey: _shellNavigatorHomeKey,
          //   routes: <RouteBase>[
          //     // Top route inside the home branch.
          //     GoRoute(
          //       path: '/home',
          //       pageBuilder: (_, __) {
          //         // We use a NoTransitionPage inside said route to
          //         // prevent unintended animations when switching between tabs
          //         // (this is the default behaviour on popular iOS apps).
          //         return const NoTransitionPage(
          //           child: RootPlaceholderScreen(
          //             label: 'Home',
          //             detailsPath: '/home/details',
          //           ),
          //         );
          //       },
          //       routes: <RouteBase>[
          //         GoRoute(
          //           path: 'details',
          //           builder: (_, __) =>
          //               const DetailsPlaceholderScreen(label: 'Home'),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),

          // Second branch (community).
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCommunityKey,
            routes: <RouteBase>[
              // Top route inside the community branch.
              GoRoute(
                path: '/quiz-mode',
                pageBuilder: (_, __) {
                  return const NoTransitionPage(
                    child: ReadyQuizPage(),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'start-quiz',
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: QuizPage(),
                    ),
                  ),
                  GoRoute(
                    path: 'finished-quiz',
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: FinishedQuizPage(),
                    ),
                  ),
                  GoRoute(
                    path: 'solutions-quiz',
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: SolutionsQuizPage(),
                    ),
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
                path: '/quiz-upload',
                pageBuilder: (_, __) {
                  return const NoTransitionPage(
                    child: UploadQuestionPage(),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'finished-quiz-upload',
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: UploadSuccessPage(),
                    ),
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
                  return NoTransitionPage(child: ProfileScreen());
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'view-my-questions',
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: ViewQuestionsScreen(),
                    ),
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
