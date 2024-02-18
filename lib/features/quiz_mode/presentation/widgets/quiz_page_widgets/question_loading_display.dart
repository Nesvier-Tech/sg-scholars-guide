import 'package:flutter/material.dart';

class QuestionLoadingDisplay extends StatelessWidget {
  const QuestionLoadingDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: Colors.white, backgroundColor: Colors.yellow,));
  }
}
