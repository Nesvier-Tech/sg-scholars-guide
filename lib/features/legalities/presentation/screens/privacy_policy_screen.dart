import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => GoRouter.of(context).go('/login'),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => GoRouter.of(context).go('/signup'),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Privacy Policy',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 16.00, 32.0, 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card.outlined(
                    child: QuillToolbar.simple(
                      configurations: QuillSimpleToolbarConfigurations(
                        controller: _controller,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 400.0,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: QuillEditor.basic(
                          configurations: QuillEditorConfigurations(
                            controller: _controller,
                            readOnly: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),

                  // Go back.
                  TextButton(
                    onPressed: () => GoRouter.of(context).go('/signup'),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
