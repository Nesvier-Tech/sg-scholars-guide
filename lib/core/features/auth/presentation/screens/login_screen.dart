import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../../../service_locator/service_locator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final String googleIconPath = 'assets/icons/icons8-google.svg';
  // final String facebookIconPath = 'assets/icons/icons8-facebook.svg';
  final String anonymousIconPath = 'assets/icons/icons8-incognito-48.png';

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Welcome message.
                  Text(
                    'Welcome Scholar',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text('Log in to continue your learning journey'),
                  const SizedBox(height: 40.0),

                  // // Log in with Google.
                  // FilledButton.tonal(
                  //   onPressed: () async {
                  //     // Show alert dialog.
                  //     await showDialog<AlertDialog>(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return AlertDialog(
                  //           title: const Text('Coming Soon'),
                  //           content: const Text(
                  //             'This feature is coming soon.',
                  //           ),
                  //           actions: <TextButton>[
                  //             TextButton(
                  //               onPressed: () {
                  //                 Navigator.of(context).pop();
                  //               },
                  //               child: const Text('OK'),
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       SvgPicture.asset(
                  //         googleIconPath,
                  //         width: 24.0,
                  //         height: 24.0,
                  //         semanticsLabel: 'Google Icon Logo',
                  //       ),
                  //       const SizedBox(width: 8.0),
                  //       const Text('Log in with Google'),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 8.0),

                  // // Log in Anonymously.
                  // FilledButton.tonal(
                  //   onPressed: () {
                  //     // Show alert dialog.
                  //     showDialog<AlertDialog>(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return AlertDialog(
                  //           title: const Text('Coming Soon'),
                  //           content: const Text(
                  //             'This feature is coming soon.',
                  //           ),
                  //           actions: <TextButton>[
                  //             TextButton(
                  //               onPressed: () {
                  //                 Navigator.of(context).pop();
                  //               },
                  //               child: const Text('OK'),
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Image.asset(
                  //         anonymousIconPath,
                  //         width: 24.0,
                  //         height: 24.0,
                  //         semanticLabel: 'Anonymous Icon',
                  //       ),
                  //       const SizedBox(width: 8.0),
                  //       const Text('Log in Anonymously'),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 32.0),

                  // // Horizontal divider.
                  // const Row(
                  //   children: <Widget>[
                  //     Expanded(child: Divider(endIndent: 8.0)),
                  //     Text('OR'),
                  //     Expanded(child: Divider(indent: 8.0)),
                  //   ],
                  // ),
                  // const SizedBox(height: 32.0),

                  SvgPicture.asset(
                    'assets/illustrations/undraw_secure_login_pdn4.svg',
                    width: 150.0,
                    height: 150.0,
                    semanticsLabel: 'Secure Login Illustration',
                  ),

                  const SizedBox(height: 40.0),

                  // Log in with Email form.
                  const LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _authService = services<FirebaseAuth>();
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormFieldState<String>>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Email text field.
          FormBuilderTextField(
            key: _emailFieldKey,
            name: 'email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              border: OutlineInputBorder(),
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ],
            ),
          ),
          const SizedBox(height: 32.0),

          // Password text field.
          FormBuilderTextField(
            name: 'password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                icon: _isPasswordVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                color: _isPasswordVisible
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(8),
              ],
            ),
          ),

          // Forgot password?
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                final String email =
                    _formKey.currentState?.value['email'] ?? '';
                GoRouter.of(context).go('/login/forgot-password', extra: email);
              },
              child: const Text('Forgot password?'),
            ),
          ),
          const SizedBox(height: 32.0),

          // Log in button.
          FilledButton(
            onPressed: () async {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                try {
                  final String email = _formKey.currentState?.value['email'];
                  final String password =
                      _formKey.currentState?.value['password'];
                  late final UserCredential userCredential;

                  userCredential =
                      await _authService.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  final String uid = userCredential.user!.uid;
                  services<Logger>().i('User $uid logged in.');

                  if (context.mounted) {
                    GoRouter.of(context).go('/profile', extra: uid);
                  }
                } on FirebaseAuthException catch (e) {
                  services<Logger>().e('Error: $e');

                  // Build human readable error message.
                  String errorMessage;
                  switch (e.code) {
                    case 'invalid-email':
                      errorMessage = 'Invalid email address.';
                      break;
                    case 'user-not-found':
                      errorMessage = 'User not found.';
                      break;
                    case 'wrong-password':
                      errorMessage = 'Wrong password.';
                      break;
                    case 'user-disabled':
                      errorMessage = 'User account is disabled.';
                      break;
                    case 'too-many-requests':
                      errorMessage = 'Too many requests. Try again later.';
                      break;
                    case 'operation-not-allowed':
                      errorMessage = 'Operation not allowed.';
                      break;
                    case 'invalid-credential':
                      errorMessage = 'Invalid credential.';
                      break;
                    default:
                      errorMessage = 'An error occurred.';
                  }

                  // Show alert dialog.
                  if (context.mounted) {
                    await showDialog<AlertDialog>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          content: Text(errorMessage),
                          actions: <TextButton>[
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
              }
            },
            child: const Text('Log in'),
          ),
          const SizedBox(height: 16.0),

          // Don't have an account? Sign up.
          Row(
            children: <Widget>[
              const Text('Don\'t have an account? '),
              TextButton(
                onPressed: () => GoRouter.of(context).go('/signup'),
                child: const Text('Sign up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
