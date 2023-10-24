import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_firebase/blocks/authentication_cubit.dart';
import 'package:project_firebase/blocks/student_cubit.dart';

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
      body: BlocProvider<StudentCubit>(
        create: (_) => StudentCubit()..getStudents(),
        child: BlocBuilder<StudentCubit, StudentState>(
          builder: (context, state) {
            if (state is StudentStateLoaded) {
              return ListView.builder(
                itemCount: state.students.length,
                itemBuilder: (context, index) {
                  final student = state.students.elementAt(index);
                  return ListTile(
                    title: Text(student.firstName ?? 'Error'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(student.lastName ?? 'Error'),
                        Text(
                            'Langage préféré: ${student.favoriteLanguage ?? 'Unknown'}'),
                      ],
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
