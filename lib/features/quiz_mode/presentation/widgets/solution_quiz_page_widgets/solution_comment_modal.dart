// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/firestore_model.dart';
import 'package:scholars_guide/features/quiz_mode/data/repositories/quiz_mode_repository_impl.dart';

class SolutionCommentModal extends StatefulWidget {
  const SolutionCommentModal({
    super.key,
    required this.comments,
    required this.docRef,
  });

  final List<Map> comments;
  final DocumentReference docRef;

  @override
  State<SolutionCommentModal> createState() => _SolutionCommentModalState();
}

class _SolutionCommentModalState extends State<SolutionCommentModal> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.comments.length + 1,
              itemBuilder: (context, index) {
                if (widget.comments.isEmpty) {
                  return Center(
                    child: Text(
                      "No comments yet",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }
                if (index >= widget.comments.length) return null;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(widget.comments[index]
                            [FireStore.commentInitials] ??
                        'NA'),
                  ),
                  title: Text(widget.comments[index][FireStore.commentName] ??
                      'No name'),
                  subtitle: Text(widget.comments[index]
                          [FireStore.commentData] ??
                      'No comment'),
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
                      QuizModeRepositoryImpl().addComment(
                          docRef: widget.docRef, comment: _controller.text);
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Comment added!'),
                          duration: Duration(seconds: 1),
                        ),
                      );
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
