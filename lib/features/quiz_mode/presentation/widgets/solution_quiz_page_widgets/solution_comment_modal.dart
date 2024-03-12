// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ! TESTING
class SolutionCommentModal extends StatefulWidget {
  const SolutionCommentModal({super.key});

  @override
  State<SolutionCommentModal> createState() => _SolutionCommentModalState();
}

class _SolutionCommentModalState extends State<SolutionCommentModal> {
  final TextEditingController _controller = TextEditingController();
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
      'initials': 'MV',
      'user': 'Mark Viernes Sabado Linggo',
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
          Expanded(
            child: ListView.builder(
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 10.0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _controller,
                style: TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                  labelText: 'Write a comment...',
                  labelStyle: TextStyle(fontSize: 14.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send_rounded),
                    onPressed: () {
                      // Handle sending comment
                      print(_controller.text);
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
