import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../../../service_locator/service_locator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  final String illustrationPath =
      'assets/illustrations/undraw_forgot_password_re_hxwm.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Message.
                  Text(
                    'Forgot Your Password?',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'Enter your registered email below to receive a password reset link.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 32.0),

                  // Forgot password illustration.
                  SizedBox(
                    width: double.infinity,
                    child: SvgPicture.asset(
                      illustrationPath,
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                  const SizedBox(height: 32.0),

                  // Password reset form using email.
                  const PasswordResetForm(),
                  const SizedBox(height: 16.0),

                  // Go back button.
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        // Send the email to reset the password.

                        GoRouter.of(context).go('/login');
                      },
                      child: const Text('Go back'),
                    ),
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

class PasswordResetForm extends StatefulWidget {
  const PasswordResetForm({super.key});

  @override
  State<PasswordResetForm> createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends State<PasswordResetForm> {
  final _authService = services<FirebaseAuth>();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Email field.
          FormBuilderTextField(
            name: 'email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            initialValue: (GoRouterState.of(context).extra ?? '') as String,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          const SizedBox(height: 32.0),

          // Reset password button.
          FilledButton(
            onPressed: () async {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                final String email =
                    (_formKey.currentState?.value['email'] ?? '') as String;

                // Send the email to reset the password.
                try {
                  await _authService.sendPasswordResetEmail(email: email);
                  services<Logger>().i('Password reset email sent to $email.');
                } on FirebaseAuthException catch (e) {
                  services<Logger>()
                      .e('Error sending password reset email: $e');

                  // Show dialog with error message.
                  if (context.mounted) {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: Text(e.message ?? 'An error occurred.'),
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

                if (context.mounted) {
                  GoRouter.of(context).go(
                    '/login/password-reset-email-sent-confirmation',
                  );
                }
              }
            },
            child: const Text('Reset Password'),
          ),
        ],
      ),
    );
  }
}
