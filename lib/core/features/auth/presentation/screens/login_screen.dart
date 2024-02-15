import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final String googleIconPath = 'assets/icons/icons8-google.svg';
  // final String facebookIconPath = 'assets/icons/icons8-facebook.svg';
  final String anonymousIconPath = 'assets/icons/icons8-incognito-48.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                const SizedBox(height: 32.0),

                // Log in with Google.
                FilledButton.tonal(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        googleIconPath,
                        width: 24.0,
                        height: 24.0,
                        semanticsLabel: 'Google Icon Logo',
                      ),
                      const SizedBox(width: 8.0),
                      const Text('Log in with Google'),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),

                // Log in Anonymously.
                FilledButton.tonal(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        anonymousIconPath,
                        width: 24.0,
                        height: 24.0,
                        semanticLabel: 'Anonymous Icon',
                      ),
                      const SizedBox(width: 8.0),
                      const Text('Log in Anonymously'),
                    ],
                  ),
                ),
                const SizedBox(height: 32.0),

                // Horizontal divider.
                const Row(
                  children: <Widget>[
                    Expanded(child: Divider(endIndent: 8.0)),
                    Text('OR'),
                    Expanded(child: Divider(indent: 8.0)),
                  ],
                ),
                const SizedBox(height: 32.0),

                // Log in with Email form.
                const LoginForm(),
              ],
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
              ),
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(16),
              ],
            ),
          ),

          // Forgot password?
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).go('/login/forgot-password');
              },
              child: const Text('Forgot password?'),
            ),
          ),
          const SizedBox(height: 32.0),

          // Log in button.
          FilledButton(
            onPressed: () {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                GoRouter.of(context).go('/home');
              }
            },
            child: const Text('Log in'),
          ),
          const SizedBox(height: 16.0),

          // Don't have an account? Sign up.
          Row(
            children: <Widget>[
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {},
                child: const Text('Sign up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
