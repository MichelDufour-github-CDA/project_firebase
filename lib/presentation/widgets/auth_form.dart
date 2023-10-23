import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email'
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
            labelText: 'Password'
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),
      ],
    );
  }
}
