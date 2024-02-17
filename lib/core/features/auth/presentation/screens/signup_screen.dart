import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: PopScope(
            canPop: false,
            onPopInvoked: (_) => GoRouter.of(context).go('/login'),
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
                    const SignupForm(),
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

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  int usernameLength = 0;
  bool? isUsernameAvailable;
  bool wasUsernameTextFieldTappedAtLeastOnce = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

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

    if ((numOfCharacters < 6) && wasUsernameTextFieldTappedAtLeastOnce) {
      return Colors.red;
    }

    return null;
  }

  String? _getUsernameLengthErrorText(int usernameLength) {
    if (usernameLength > 20) {
      return 'Must not exceed 20 characters';
    }

    if ((usernameLength < 6) && wasUsernameTextFieldTappedAtLeastOnce) {
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
                        usernameLength = value?.length ?? 0;
                      });
                    },
                    onTap: () {
                      setState(() {
                        wasUsernameTextFieldTappedAtLeastOnce = true;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      suffixIcon: _buildUsernameAvailabilityIconIndicator(
                        isUsernameAvailable,
                      ),
                      border: const OutlineInputBorder(),
                      counterText: '$usernameLength / 20',
                      counterStyle: TextStyle(
                        color: _getCounterTextColor(usernameLength),
                      ),
                      errorText: _getUsernameLengthErrorText(usernameLength),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.maxLength(20),
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
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: const OutlineInputBorder(),
                      suffixIcon: TextButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: isPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      errorMaxLines: 2,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(16),
                    ]),
                  ),
                  const SizedBox(height: 16.0),

                  // Confirm Password.
                  FormBuilderTextField(
                    name: 'confirmPassword',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: !isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      border: const OutlineInputBorder(),
                      suffixIcon: TextButton(
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordVisible =
                                !isConfirmPasswordVisible;
                          });
                        },
                        child: isConfirmPasswordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      errorMaxLines: 2,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(16),
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

          // Sign up button.
          FilledButton(
            onPressed: () {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                GoRouter.of(context).go('/home');
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
