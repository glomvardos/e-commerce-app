import 'package:e_commerce_app/presentation/screens/auth/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: RegisterForm(),
      ),
    );
  }
}
