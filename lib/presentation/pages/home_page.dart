import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_firebase/blocks/authentication_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String name = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthenticationCubit>().logout();
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          if (state.currentUser != null) {
            return Text('Hello ${state.currentUser!.email} !');
          }

          return const Text('Hello !');
        },
      ),
    );
  }
}
