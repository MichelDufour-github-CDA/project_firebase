import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_firebase/blocks/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_firebase/presentation/pages/register_page.dart';
import 'package:project_firebase/presentation/widgets/auth_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const String name = 'login';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          AuthForm(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              // J'appelle le cubit pour me connecter.
              context.read<AuthenticationCubit>().login(
                    email: _emailController.text.trim(),
                    password: _passwordController.text,
                  );
              // ATTENTION: On ne s'occupe pas de go_router car il sera
              // lui-meme réactif aux changements d'états de connexion.
            },
            child: const Text('Se connecter'),
          ),
          const SizedBox(height: 10,),
          TextButton(onPressed: () {
            // rediriger vers la RegisterPage
            context.goNamed(RegisterPage.name);
          },
          child: const Text('Aller à la page inscription'))
        ],
      ),
    );
  }
}
