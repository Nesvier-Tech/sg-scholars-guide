import 'package:flutter/material.dart';

class DetailsPlaceholderPage extends StatefulWidget {
  const DetailsPlaceholderPage({super.key, required this.label});

  final String label;

  @override
  State<StatefulWidget> createState() => _DetailsPlaceholderPageState();
}

class _DetailsPlaceholderPageState extends State<DetailsPlaceholderPage> {
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
