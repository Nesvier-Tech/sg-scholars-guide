import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../../../service_locator/service_locator.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => GoRouter.of(context).go('/login'),
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Welcome message.
                    Text(
                      'Welcome to Scholar\'s Guide!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Text('Your Learning Journey Begins Here!'),
                    const SizedBox(height: 32.0),

                    // Sign up form.
                    const PersonalInformationForm(),
                    const SizedBox(height: 16.0),

                    // Go back button.
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => GoRouter.of(context).go('/login'),
                        child: const Text('Go back'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PersonalInformationForm extends StatefulWidget {
  const PersonalInformationForm({super.key});

  @override
  State<PersonalInformationForm> createState() => _PersonalInformationForm();
}

class _PersonalInformationForm extends State<PersonalInformationForm> {
  final _authInstance = services<FirebaseAuth>();
  final _dbInstance = services<FirebaseFirestore>();
  final _formKey = GlobalKey<FormBuilderState>();
  final _logger = services<Logger>();
  int _usernameLength = 0;
  bool? _isUsernameAvailable;
  bool _wasUsernameTextFieldTappedAtLeastOnce = false;
  bool _isPasswordVisible = false;
  final bool _isConfirmPasswordVisible = false;

  Widget? _buildUsernameAvailabilityIconIndicator(bool? isUsernameAvailable) {
    if (isUsernameAvailable == null) {
      return null;
    }

    return Icon(
      isUsernameAvailable ? Icons.check_circle : Icons.cancel,
      color: isUsernameAvailable ? Colors.green : Colors.red,
    );
  }

  Color? _getCounterTextColor(int numOfCharacters) {
    if (numOfCharacters > 20) {
      return Colors.red;
    }

    if ((numOfCharacters < 6) && _wasUsernameTextFieldTappedAtLeastOnce) {
      return Colors.red;
    }

    return null;
  }

  String? _getUsernameLengthErrorText(int usernameLength) {
    if (usernameLength > 20) {
      return 'Must not exceed 20 characters';
    }

    if ((usernameLength < 6) && _wasUsernameTextFieldTappedAtLeastOnce) {
      return 'Must be at least 6 characters';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Personal Information Card.
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      const Icon(Icons.person_outline),
                      const SizedBox(width: 8.0),
                      Text(
                        'Personal Information',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // Username.
                  FormBuilderTextField(
                    name: 'username',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (String? value) {
                      setState(() {
                        _usernameLength = value?.length ?? 0;
                      });
                    },
                    onTap: () {
                      setState(() {
                        _wasUsernameTextFieldTappedAtLeastOnce = true;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      suffixIcon: _buildUsernameAvailabilityIconIndicator(
                        _isUsernameAvailable,
                      ),
                      border: const OutlineInputBorder(),
                      counterText: '$_usernameLength / 20',
                      counterStyle: TextStyle(
                        color: _getCounterTextColor(_usernameLength),
                      ),
                      errorText: _getUsernameLengthErrorText(_usernameLength),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.maxLength(20),
                      FormBuilderValidators.match(
                        r'^[^ ]+$',
                        errorText: 'No spaces allowed',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 16.0),

                  // Email.
                  FormBuilderTextField(
                    name: 'email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 16.0),

                  //
                ],
              ),
            ),
          ),
          const SizedBox(height: 32.0),

          // Account Security Card.
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      const Icon(Icons.security_outlined),
                      const SizedBox(width: 8.0),
                      Text(
                        'Account Security',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // Password.
                  FormBuilderTextField(
                    name: 'password',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
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
                      errorMaxLines: 2,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                  ),
                  const SizedBox(height: 16.0),

                  // // Confirm Password.
                  // FormBuilderTextField(
                  //   name: 'confirmPassword',
                  //   keyboardType: TextInputType.visiblePassword,
                  //   textInputAction: TextInputAction.done,
                  //   obscureText: !_isConfirmPasswordVisible,
                  //   decoration: InputDecoration(
                  //     labelText: 'Confirm Password',
                  //     hintText: 'Re-enter your password',
                  //     border: const OutlineInputBorder(),
                  //     suffixIcon: IconButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           _isConfirmPasswordVisible =
                  //               !_isConfirmPasswordVisible;
                  //         });
                  //       },
                  //       icon: _isConfirmPasswordVisible
                  //           ? const Icon(Icons.visibility)
                  //           : const Icon(Icons.visibility_off),
                  //       color: _isConfirmPasswordVisible
                  //           ? Theme.of(context).colorScheme.primary
                  //           : null,
                  //     ),
                  //     errorMaxLines: 2,
                  //   ),
                  //   validator: FormBuilderValidators.compose([
                  //     FormBuilderValidators.required(),
                  //     FormBuilderValidators.minLength(8),

                  //     // TODO: [P*] Investigate this bug. Sometimes this validator does not work.
                  //     // It still says 'Passwords do not match' even when they do.
                  //     FormBuilderValidators.equal(
                  //       _formKey.currentState?.fields['password']?.value ?? '',
                  //       errorText: 'Passwords do not match',
                  //     ),
                  //   ]),
                  // ),
                  // const SizedBox(height: 16.0),

                  // Password Hint.
                  Text(
                    'Passwords must be at least 8 characters long.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32.0),

          // Sign up button.
          FilledButton(
            onPressed: () async {
              // Print the password and confirm password fields.
              _logger.i(_formKey.currentState?.fields['password']?.value);
              _logger
                  .i(_formKey.currentState?.fields['confirmPassword']?.value);
              // Check if they are equal.
              _logger.i(
                _formKey.currentState?.fields['password']?.value ==
                    _formKey.currentState?.fields['confirmPassword']?.value,
              );

              if (_formKey.currentState?.saveAndValidate() ?? false) {
                _logger.i('Form is valid');
                // Create user.
                final String email =
                    _formKey.currentState?.fields['email']?.value;
                final String password =
                    _formKey.currentState?.fields['password']?.value;

                late UserCredential userCredential;
                late String uid;

                userCredential =
                    await _authInstance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );

                uid = userCredential.user!.uid;
                _logger.i('User created with UID: $uid');

                // Upload user data to Firestore.
                final Map<String, dynamic> data = {
                  'username': _formKey.currentState?.fields['username']?.value,
                  'emails': {
                    'primaryEmail': {
                      'emailAddress': email,
                      'isVerified': false,
                    },
                  },
                  'accountTypes': ['regular'],
                  'createdAt': FieldValue.serverTimestamp(),
                  'updatedAt': FieldValue.serverTimestamp(),
                };

                await _dbInstance.collection('users').doc(uid).set(data);
                _logger.i('User data uploaded to Firestore');

                // Send email verification.
                await userCredential.user!.sendEmailVerification();
                _logger.i('Email verification sent');

                if (context.mounted) {
                  GoRouter.of(context).go(
                    '/signup/email-verification-sent',
                    extra: email,
                  );
                }
              }
            },
            child: const Text('Sign up'),
          ),
          const SizedBox(height: 8.0),

          // Terms of Service and Privacy Policy.
          Column(
            children: <Widget>[
              Text(
                'By signing up, you agree to our',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => GoRouter.of(context).go('/terms-of-service'),
                    child: Text(
                      'Terms of Service',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  Text(' and ', style: Theme.of(context).textTheme.bodySmall),
                  GestureDetector(
                    onTap: () => GoRouter.of(context).go('/privacy-policy'),
                    child: Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AccountSecurityForm extends StatefulWidget {
  const AccountSecurityForm({super.key});

  @override
  State<AccountSecurityForm> createState() => _AccountSecurityForm();
}

class _AccountSecurityForm extends State<AccountSecurityForm> {
  final _authInstance = services<FirebaseAuth>();
  final _dbInstance = services<FirebaseFirestore>();
  final _formKey = GlobalKey<FormBuilderState>();
  final _logger = services<Logger>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Widget? _buildUsernameAvailabilityIconIndicator(bool? isUsernameAvailable) {
    if (isUsernameAvailable == null) {
      return null;
    }

    return Icon(
      isUsernameAvailable ? Icons.check_circle : Icons.cancel,
      color: isUsernameAvailable ? Colors.green : Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Account Security Card.
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      const Icon(Icons.security_outlined),
                      const SizedBox(width: 8.0),
                      Text(
                        'Account Security',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // Password.
                  FormBuilderTextField(
                    name: 'password',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
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
                      errorMaxLines: 2,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                  ),
                  const SizedBox(height: 16.0),

                  // Confirm Password.
                  FormBuilderTextField(
                    name: 'confirmPassword',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                        icon: _isConfirmPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        color: _isConfirmPasswordVisible
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                      errorMaxLines: 2,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),

                      // TODO: [P*] Investigate this bug. Sometimes this validator does not work.
                      // It still says 'Passwords do not match' even when they do.
                      FormBuilderValidators.equal(
                        _formKey.currentState?.fields['password']?.value ?? '',
                        errorText: 'Passwords do not match',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
