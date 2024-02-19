import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../../service_locator/service_locator.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _authService = services<FirebaseAuth>();
  final _dbService = services<FirebaseFirestore>();

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
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  // User uid.
                  Text('User UID: ${_authService.currentUser?.uid}'),

                  // User email.
                  Text('User Email: ${_authService.currentUser?.email}'),

                  // User username (from Firestore).
                  StreamBuilder<DocumentSnapshot>(
                    stream: _dbService
                        .collection('users')
                        .doc(_authService.currentUser?.uid)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Loading');
                      }

                      // Convert timestamp to DateTime.
                      var createdAt =
                          (snapshot.data?.get('createdAt') as Timestamp)
                              .toDate();
                      var updatedAt = snapshot.data?.get('updatedAt').toDate();

                      // createdAt = createdAt is Timestamp
                      //     ? createdAt.toDate()
                      //     : DateTime.now();
                      // updatedAt = updatedAt is Timestamp
                      //     ? updatedAt.toDate()
                      //     : DateTime.now();

                      return Text(
                        'User Username: ${snapshot.data?.get('username')}\n'
                        'User Created At: $createdAt\n'
                        'User Updated At: $updatedAt',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
