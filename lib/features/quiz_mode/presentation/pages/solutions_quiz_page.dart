import 'package:flutter/material.dart';

class SolutionsQuizPage extends StatefulWidget {
  const SolutionsQuizPage({super.key});

  @override
  State<SolutionsQuizPage> createState() => _SolutionsQuizPageState();
}

class _SolutionsQuizPageState extends State<SolutionsQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Container();

// StreamBuilder<DocumentSnapshot>(
//                   stream: _dbService
//                       .collection('users')
//                       .doc(_authService.currentUser?.uid)
//                       .snapshots(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<DocumentSnapshot> snapshot) {
//                     if (snapshot.hasError) {
//                       return const Text('Something went wrong');
//                     }

//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       // Show a loading spinner.
//                       return const CircularProgressIndicator();
//                     }

//                     // Convert timestamp to DateTime.
//                     var createdAt =
//                         (snapshot.data?.get('createdAt') as Timestamp).toDate();
//                     var updatedAt = snapshot.data?.get('updatedAt').toDate();

//                     // createdAt = createdAt is Timestamp
//                     //     ? createdAt.toDate()
//                     //     : DateTime.now();
//                     // updatedAt = updatedAt is Timestamp
//                     //     ? updatedAt.toDate()
//                     //     : DateTime.now();

//                     String username =
//                         snapshot.data?.get('username') ?? 'Loading...';

//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.blue,
//                           radius: 50,
//                           child: Text(
//                             username[0].toUpperCase(),
//                             style: TextStyle(
//                               fontSize: 40,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           username,
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           _authService.currentUser?.email ?? 'Loading...',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         SizedBox(height: 32),
//                         ProfileDetailRow(
//                           title: 'UID:',
//                           detail:
//                               '***${_authService.currentUser?.uid.substring(12, _authService.currentUser?.uid.length)}' ??
//                                   'Loading...',
//                         ),
//                         SizedBox(height: 10),
//                         ProfileDetailRow(
//                           title: 'Joined in:',
//                           detail: 'January 1, 2022',
//                         ),
//                         SizedBox(height: 10),
//                         ProfileDetailRow(
//                           title: 'Updated in:',
//                           detail: 'February 20, 2024',
//                         ),
//                       ],
//                     );
//                   }),
  }
}
