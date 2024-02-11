import 'package:flutter/material.dart';

class DetailsPlaceholderScreen extends StatefulWidget {
  const DetailsPlaceholderScreen({super.key, required this.label});

  final String label;

  @override
  State<StatefulWidget> createState() => _DetailsPlaceholderScreenState();
}

class _DetailsPlaceholderScreenState extends State<DetailsPlaceholderScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen - ${widget.label}')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Details for ${widget.label} - Counter: $_counter',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Text('Increment counter'),
            ),
          ],
        ),
      ),
    );
  }
}
