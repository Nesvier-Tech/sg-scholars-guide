import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../../service_locator/service_locator.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _authService = services<FirebaseAuth>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          // Triple dot menu.
          PopupMenuButton<String>(
            onSelected: (String result) async {
              if (result == 'Settings') {
              } else if (result == 'Sign Out') {
                // Sign out user using FirebaseAuth.
                await _authService.signOut();
                services<Logger>().i('User signed out.');

                // Navigate to login screen.
                if (context.mounted) {
                  GoRouter.of(context).go('/login');
                }
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem<String>(
                value: 'Sign Out',
                child: Text('Sign Out'),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          const Text('Profile Screen'),
        ]),
      ),
    );
  }
}
