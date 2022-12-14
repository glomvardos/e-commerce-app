import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/authentication_bloc/authentication_bloc.dart';
import '../register_screen.dart';
import './auth_nav_btn.dart';
import '../../../widgets/form/form_input.dart';
import '../../../widgets/ui/primary_btn.dart';
import '../../../../utils/toast_message.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onLoginUser() {
      if (_formKey.currentState!.validate()) {
        context.read<AuthenticationBloc>().add(
              LoginUser(
                username: _usernameController.text.trim(),
                password: _passwordController.text.trim(),
              ),
            );
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (_, state) {
        if (state is AuthenticationFailure) {
          ToastMessage.error(context, state.error);
        }
      },
      child: Center(
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
                    onClickHandler: onLoginUser,
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
      ),
    );
  }
}
