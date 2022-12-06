import 'package:flutter/material.dart';

import './auth_nav_btn.dart';
import '../../../widgets/form_input.dart';
import '../../../widgets/primary_btn.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isLoading = false;
  bool _autoValidate = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  margin: const EdgeInsets.all(20),
                  color: Theme.of(context).colorScheme.primary,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                      bottom: 10,
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          FormInput(
                              labelText: 'Username',
                              controller: _usernameController),
                          const SizedBox(height: 15),
                          FormInput(
                              labelText: 'First Name',
                              controller: _firstnameController),
                          const SizedBox(height: 15),
                          FormInput(
                              labelText: 'Last Name',
                              controller: _lastnameController),
                          const SizedBox(height: 15),
                          FormInput(
                              labelText: 'Email', controller: _emailController),
                          const SizedBox(height: 15),
                          FormInput(
                              labelText: 'Password',
                              controller: _passwordController),
                          const SizedBox(height: 15),
                          FormInput(
                              labelText: 'Confirm Password',
                              controller: _confirmPasswordController),
                          const SizedBox(height: 15),
                          PrimaryBtn(text: 'Register', onClickHandler: () {}),
                          AuthNavButton(
                            text: 'Already have an account?',
                            btnText: 'Login',
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
