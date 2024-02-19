import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:scholars_guide/service_locator/service_locator.dart';

class EmailVerificationSentScreen extends StatelessWidget {
  const EmailVerificationSentScreen({super.key});

  final String illustrationPath =
      'assets/illustrations/undraw_mail_sent_re_0ofv.svg';

  @override
  Widget build(BuildContext context) {
    final String email = (GoRouterState.of(context).extra ?? '') as String;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
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

                // Message.
                Text(
                  'Check Your Email!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8.0),

                // TODO [P3]: Refactor. Probably, use the Wrap widget.
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'We\'ve just sent an email to you at',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            '. Tap on the link',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Text(
                        'to verify your account.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32.0),

                // Open email app button.
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      // Show dialog that the feature is under development.
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Feature Under Development'),
                            content: const Text(
                              'This feature is under development. The app is currently in development phase. Please check back later.',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Open Email App'),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Continue button.
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.tonal(
                    onPressed: () async {
                      // Determine if the email is verified.
                      // Reload the user to get the latest data.
                      await FirebaseAuth.instance.currentUser!.reload();

                      // Get UserCredential from FirebaseAuth.
                      final bool isEmailVerified =
                          FirebaseAuth.instance.currentUser!.emailVerified;

                      services<Logger>().i('isEmailVerified: $isEmailVerified');

                      // If email is verified, navigate to home.
                      if (isEmailVerified) {
                        if (context.mounted) {
                          GoRouter.of(context).go('/home');
                        }
                      } else {
                        // Show dialog that the email is not yet verified.
                        if (context.mounted) {
                          await showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Email Not Verified'),
                                content: const Text(
                                  'Your email is not yet verified. Please verify your email to continue.',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: const Text('Continue'),
                  ),
                ),
                const SizedBox(height: 32.0),

                // Didn't receive the email? Resend.
                Row(
                  children: <Widget>[
                    const Text('Didn\'t receive the email? '),
                    GestureDetector(
                      onTap: () async {
                        // Show dialog that the feature is under development.
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Feature Under Development'),
                              content: const Text(
                                'This feature is under development. The app is currently in development phase. Please check back later.',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Resend',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
