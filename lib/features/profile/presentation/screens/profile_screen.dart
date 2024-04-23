import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/question_loading_display.dart';

import '../../../../service_locator/service_locator.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _authService = services<FirebaseAuth>();
  final _dbService = services<FirebaseFirestore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('User Profile',
            style: TextStyle(fontWeight: FontWeight.bold)),
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
              padding: EdgeInsets.all(32.0),
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
                      return Expanded(child: const QuestionLoadingDisplay());
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
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          _authService.currentUser?.email ?? 'Loading...',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 32),
                        ProfileDetailRow(
                          title: 'UID:',
                          detail:
                              '***${_authService.currentUser?.uid.substring(12, _authService.currentUser?.uid.length)}' ??
                                  'Loading...',
                        ),
                        SizedBox(height: 10),
                        ProfileDetailRow(
                          title: 'Joined in:',
                          detail: 'January 1, 2022',
                        ),
                        SizedBox(height: 10),
                        ProfileDetailRow(
                          title: 'Updated in:',
                          detail: 'February 20, 2024',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: FilledButton(
                            onPressed: () {
                              GoRouter.of(context).go(
                                '/profile/view-my-questions',
                              );
                            },
                            child: Text(
                              "View My Questions",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
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
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          detail,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
