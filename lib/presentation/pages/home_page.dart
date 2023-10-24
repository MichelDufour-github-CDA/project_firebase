import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_firebase/blocks/authentication_cubit.dart';
import 'package:project_firebase/blocks/student_cubit.dart';
import 'package:project_firebase/presentation/widgets/student_list.dart';
import 'package:project_firebase/presentation/widgets/student_submit_form.dart';

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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              'Liste des étudiants',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            const StudentList(),
            const Divider(),
            Text(
              'Ajouter un étudiant',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            StudentSubmitForm(),
          ],
        ),
      ),
    );
  }
}
