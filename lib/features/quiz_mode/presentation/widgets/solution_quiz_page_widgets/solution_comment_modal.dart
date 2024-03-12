import 'package:flutter/material.dart';

// ! TESTING
class SolutionCommentModal extends StatefulWidget {
  const SolutionCommentModal({super.key});

  @override
  State<SolutionCommentModal> createState() => _SolutionCommentModalState();
}

class _SolutionCommentModalState extends State<SolutionCommentModal> {
  final comments = [
    {
      'initials': 'WDT',
      'user': 'Wilson De Tan',
      'comment': 'This is a very good solution',
    },
    {
      'initials': 'CD',
      'user': 'Charles Darwin',
      'comment': 'I think this solution is wrong',
    },
    {
      'initials': 'MVL',
      'user': 'Mark Victory Liner',
      'comment': 'I think this solution is wrong',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(comments[index]['initials'] ?? 'AB'),
                  backgroundColor: Colors.blue,
                ),
                title: Text(comments[index]['user'] ?? 'Anonymous'),
                subtitle: Text(comments[index]['comment'] ?? 'No comment'),
              );
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                labelText: 'Write a comment...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send_rounded),
                  onPressed: () {
                    // Handle sending comment
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
