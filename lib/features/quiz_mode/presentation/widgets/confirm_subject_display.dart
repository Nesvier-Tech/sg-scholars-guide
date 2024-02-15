import 'package:flutter/material.dart';

class ConfirmSubjectDisplay extends StatelessWidget {
  const ConfirmSubjectDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text("Are you sure you want to take the quiz on this subject?"),
          ElevatedButton(onPressed: () {}, child: const Text("Let's Start!")),
          ElevatedButton(onPressed: () {}, child: const Text("Go Back")),
        ],
      ),
    );
  }
}