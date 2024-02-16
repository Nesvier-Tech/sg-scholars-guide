import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key});

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
                  // Welcome message.
                  Text(
                    'Welcome Scholar',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text('Sign up to continue your learning journey'),
                  const SizedBox(height: 32.0),

                  // Sign up form.
                  const SignupForm(),
                  const SizedBox(height: 16.0),

                  // Go back button.
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
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

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Full name.
        FormBuilderTextField(
          name: 'full_name',
          decoration: const InputDecoration(
            labelText: 'Full Name',
            hintText: 'Enter your full name',
          ),
          validator: FormBuilderValidators.required(),
        ),
        const SizedBox(height: 16.0),

        // Email.
        FormBuilderTextField(
          name: 'email',
          decoration: const InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ]),
        ),
        const SizedBox(height: 16.0),

        // Password.
        FormBuilderTextField(
          name: 'password',
          decoration: const InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
          obscureText: true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(8),
          ]),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
