import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PasswordResetEmailSentConfirmationScreen extends StatelessWidget {
  const PasswordResetEmailSentConfirmationScreen({super.key});

  final String illustrationPath =
      'assets/illustrations/undraw_mail_sent_re_0ofv.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Message.
                Text(
                  'Email Has Been Sent!',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'Please check your inbox for the password reset link. If you don\'t see it, please check your spam folder.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 32.0),

                // Illustration.
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    illustrationPath,
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                const SizedBox(height: 32.0),

                // Log in button.
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      GoRouter.of(context).go('/login');
                    },
                    child: const Text('Log in'),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Didn't receive the email? Resend.
                Row(
                  children: <Widget>[
                    const Text('Didn\'t receive the email? '),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).go('/login/forgot-password');
                      },
                      child: const Text('Resend'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
