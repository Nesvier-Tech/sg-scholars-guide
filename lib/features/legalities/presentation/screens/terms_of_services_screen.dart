import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => GoRouter.of(context).go('/signup'),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => GoRouter.of(context).go('/signup'),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Terms of Service'),
        ),
        body: const SafeArea(
          child: Center(
            child: Text('Terms of Service Screen'),
          ),
        ),
      ),
    );
  }
}
