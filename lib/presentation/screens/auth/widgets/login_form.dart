import 'package:flutter/material.dart';

import '../register_screen.dart';
import './auth_nav_btn.dart';
import '../../../widgets/form_input.dart';
import '../../../widgets/primary_btn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoading = false;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        elevation: 5,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
            bottom: 10,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: _autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FormInput(
                  labelText: 'Username',
                  controller: _usernameController,
                ),
                const SizedBox(height: 15),
                FormInput(
                  labelText: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                PrimaryBtn(
                  text: 'Login',
                  onClickHandler: () {},
                ),
                AuthNavButton(
                  text: "Don't have an account?",
                  btnText: 'Register',
                  onPressed: () {
                    Navigator.of(context).pushNamed(RegisterScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
