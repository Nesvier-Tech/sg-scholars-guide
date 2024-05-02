import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Builds the "shell" for the app by building a [Scaffold] with a
/// [NavigationBar], where [child] is placed in the body of the [Scaffold].
///
/// Ref: https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter/
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
    // Navigator for the branch is restored.'

    if (index == navigationShell.currentIndex) {
      return;
    }

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
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color.fromARGB(0, 0, 0, 0),
        ),
        child: NavigationBar(
          elevation: 0,
          selectedIndex: navigationShell.currentIndex,
          destinations: const <Widget>[
            // TODO: [P2] Provive an animation for the icons.
            // NavigationDestination(
            //   icon: Icon(Icons.home_outlined),
            //   selectedIcon: Icon(Icons.home),
            //   label: 'Home',
            // ),
            NavigationDestination(
              icon: Icon(
                Icons.school_outlined,
                color: Color.fromRGBO(207, 0, 15, 1),
              ),
              selectedIcon: Icon(
                Icons.school,
                color: Color.fromRGBO(139, 0, 9, 1),
              ),
              label: 'Quiz Mode',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.upload_file_outlined,
                color: Color.fromRGBO(207, 0, 15, 1),
              ),
              selectedIcon: Icon(
                Icons.upload_file,
                color: Color.fromRGBO(139, 0, 15, 1),
              ),
              label: 'Quiz Upload',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline_outlined,
                color: Color.fromRGBO(207, 0, 15, 1),
              ),
              selectedIcon: Icon(
                Icons.person,
                color: Color.fromRGBO(139, 0, 15, 1),
              ),
              label: 'Profile',
            ),
          ],
          onDestinationSelected: (int index) => _onTap(context, index),
        ),
      ),
    );
  }
}
