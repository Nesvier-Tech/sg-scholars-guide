import 'package:flutter/material.dart';

class UploadLoadingDisplay extends StatelessWidget {
  const UploadLoadingDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: Colors.white, backgroundColor: Colors.yellow,));
  }
}
