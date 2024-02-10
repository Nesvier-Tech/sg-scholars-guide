import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                    child: RootScreen(
                      label: 'Home',
                      detailsPath: '/home/details',
                    ),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsScreen(label: 'Home');
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
                    child: RootScreen(
                      label: 'Community',
                      detailsPath: '/community/details',
                    ),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsScreen(label: 'Community');
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
                    child: RootScreen(
                      label: 'Learn',
                      detailsPath: '/learn/details',
                    ),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsScreen(label: 'Learn');
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
                    child: RootScreen(
                      label: 'Profile',
                      detailsPath: '/profile/details',
                    ),
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsScreen(label: 'Profile');
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

/// Builds the "shell" for the app by building a [Scaffold] with a
/// [NavigationBar], where [child] is placed in the body of the [Scaffold].
class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container fo the branch Navigators.
  final StatefulNavigationShell navigationShell;

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.forum), label: 'Community'),
          NavigationDestination(icon: Icon(Icons.school), label: 'Learn'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) => _onTap(context, index),
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.label});

  final String label;

  @override
  State<StatefulWidget> createState() => _DetailsScreenState();
}

class RootScreen extends StatelessWidget {
  const RootScreen({
    super.key,
    required this.label,
    required this.detailsPath,
  });

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Root Screen - $label')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Root Screen - $label',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(detailsPath);
              },
              child: const Text('Go to details'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen - ${widget.label}')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Details for ${widget.label} - Counter: $_counter',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Text('Increment counter'),
            ),
          ],
        ),
      ),
    );
  }
}
