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
        title: const Text('User Profile'),
        actions: <Widget>[
          // Triple dot menu.
          PopupMenuButton<String>(
            onSelected: (String result) async {
              if (result == 'Settings') {
                // Show "Feature Under Development" dialog.
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Feature Under Development'),
                      content: const Text('This feature is under development.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
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
                child: Row(
                  children: <Widget>[
                    Icon(Icons.settings_outlined),
                    SizedBox(width: 8.0),
                    Text('Settings'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Sign Out',
                child: Row(
                  children: <Widget>[
                    Icon(Icons.logout_outlined),
                    SizedBox(width: 8.0),
                    Text('Sign Out'),
                  ],
                ),
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
              child: StreamBuilder<DocumentSnapshot>(
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
                      // Show a loading spinner.
                      return const CircularProgressIndicator();
                    }

                    // Convert timestamp to DateTime.
                    var createdAt =
                        (snapshot.data?.get('createdAt') as Timestamp).toDate();
                    var updatedAt = snapshot.data?.get('updatedAt').toDate();

                    // createdAt = createdAt is Timestamp
                    //     ? createdAt.toDate()
                    //     : DateTime.now();
                    // updatedAt = updatedAt is Timestamp
                    //     ? updatedAt.toDate()
                    //     : DateTime.now();

                    String username =
                        snapshot.data?.get('username') ?? 'Loading...';

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 50,
                          child: Text(
                            username[0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _authService.currentUser?.email ?? 'Loading...',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 32),
                        ProfileDetailRow(
                          title: 'UID:',
                          detail:
                              '***${_authService.currentUser?.uid.substring(12, _authService.currentUser?.uid.length)}' ??
                                  'Loading...',
                        ),
                        const SizedBox(height: 10),
                        const ProfileDetailRow(
                          title: 'Joined in:',
                          detail: 'January 1, 2022',
                        ),
                        const SizedBox(height: 10),
                        const ProfileDetailRow(
                          title: 'Updated in:',
                          detail: 'February 20, 2024',
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final String title;
  final String detail;

  const ProfileDetailRow({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          detail,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
