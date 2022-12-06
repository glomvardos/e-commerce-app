import 'package:e_commerce_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:e_commerce_app/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './auth_nav_btn.dart';
import '../../../widgets/form_input.dart';
import '../../../widgets/primary_btn.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onRegisterUser() {
      if (_formKey.currentState!.validate()) {
        context.read<AuthenticationBloc>().add(
              RegisterUser(
                username: _usernameController.text.trim(),
                firstname: _firstnameController.text.trim(),
                lastname: _lastnameController.text.trim(),
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
              ),
            );
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (_, state) {
        if (state is RegisterSuccess) {
          ToastMessage.success(
              context, 'You have been registered successfully!');
          Navigator.of(context).pop();
        }
        if (state is RegisterFailure) {
          ToastMessage.error(context, state.error);
        }
      },
      builder: (_, state) {
        if (state is AuthenticationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

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
                          key: _formKey,
                          autovalidateMode: _autoValidate
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
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
                                  labelText: 'Email',
                                  controller: _emailController),
                              const SizedBox(height: 15),
                              FormInput(
                                labelText: 'Password',
                                controller: _passwordController,
                                obscureText: true,
                              ),
                              const SizedBox(height: 15),
                              PrimaryBtn(
                                text: 'Register',
                                onClickHandler: onRegisterUser,
                              ),
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
      },
    );
  }
}
