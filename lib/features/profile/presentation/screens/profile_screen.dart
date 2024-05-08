import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
        title: const Text(
          'User Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(128, 0, 0, 1),
        actions: <Widget>[
          // Triple dot menu.
          PopupMenuButton<String>(
            iconColor: Colors.white70,
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
              // const PopupMenuItem<String>(
              //   value: 'Settings',
              //   child: Row(
              //     children: <Widget>[
              //       Icon(Icons.settings_outlined),
              //       SizedBox(width: 8.0),
              //       Text('Settings'),
              //     ],
              //   ),
              // ),
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
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  // left: -50,
                  child: Container(
                    height: 260,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(128, 0, 0, 1),
                      //shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 33.0),
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

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Show a loading spinner.
                          return const Center(child: QuestionLoadingDisplay());
                        }

                        // Convert timestamp to DateTime.
                        final DateTime createdAt =
                            (snapshot.data?.get('createdAt') as Timestamp)
                                .toDate();
                        final DateTime updatedAt =
                            (snapshot.data?.get('updatedAt') as Timestamp)
                                .toDate();

                        String username =
                            snapshot.data?.get('username') ?? 'Loading...';

                        List accountTypes =
                            snapshot.data?.get('accountTypes') ?? 'Loading...';

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.green,
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
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 116),
                            // Text(
                            //   _authService.currentUser?.email ?? 'Loading...',
                            //   style: const TextStyle(
                            //     fontSize: 18,
                            //   ),
                            // ),
                            const SizedBox(height: 32),
                            // ProfileDetailRow(
                            //   title: 'UID:',
                            //   detail:
                            //       '***${_authService.currentUser?.uid.substring(12, _authService.currentUser?.uid.length)}',
                            // ),
                            // const SizedBox(height: 10),
                            ProfileDetailRow(
                              title: 'Joined in:',
                              detail: DateFormat.yMMMd().format(createdAt),
                            ),
                            const SizedBox(height: 10),
                            ProfileDetailRow(
                              title: 'Updated in:',
                              detail: DateFormat.yMMMd().format(updatedAt),
                            ),
                            const SizedBox(height: 10),
                            ProfileDetailRow(
                              title: 'Email:',
                              detail: _authService.currentUser?.email ??
                                  'Loading...',
                            ),
                            ProfileDetailRow(
                              title: 'Account Types:',
                              detail: accountTypes.join('\n'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: FilledButton(
                                onPressed: () {
                                  GoRouter.of(context).go(
                                    '/profile/view-my-questions',
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromRGBO(128, 0, 0, 1),
                                  ),
                                ),
                                child: const Text(
                                  "View My Questions",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            accountTypes.contains('administrator')
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: FilledButton(
                                      onPressed: () {
                                        GoRouter.of(context).go(
                                          '/profile/view-all-questions',
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          const Color.fromRGBO(128, 0, 0, 1),
                                        ),
                                      ),
                                      child: const Text(
                                        "View All Questions",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Container(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/logos/sg_scholars_guide_logo-transformed-960x960.png",
                                  height: 50,
                                  width: 50,
                                ),
                                const Text(
                                  "Scholar's Guide",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      }),
                ),
              ],
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
