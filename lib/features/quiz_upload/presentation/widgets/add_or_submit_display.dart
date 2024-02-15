import 'package:flutter/material.dart';

class AddOrSubmitDisplay extends StatelessWidget {
  const AddOrSubmitDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Add Question'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit Questions'),
        )
      ],
    );
  }
}
