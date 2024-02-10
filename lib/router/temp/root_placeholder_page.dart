import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootPlaceholderPage extends StatelessWidget {
  const RootPlaceholderPage({
    super.key,
    required this.label,
    required this.detailsPath,
  });

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Root Screen - $label')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Root Screen - $label',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(detailsPath);
              },
              child: const Text('Go to details'),
            ),
          ],
        ),
      ),
    );
  }
}
