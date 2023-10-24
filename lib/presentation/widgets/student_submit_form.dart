import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_firebase/blocks/student_cubit.dart';

class StudentSubmitForm extends StatelessWidget {
  StudentSubmitForm({super.key});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _favoriteLanguageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _firstNameController,
          decoration: const InputDecoration(
            hintText: 'Prénom',
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _lastNameController,
          decoration: const InputDecoration(
            hintText: 'Nom',
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _favoriteLanguageController,
          decoration: const InputDecoration(
            hintText: 'Langage favori',
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            final firstName = _firstNameController.text.trim();
            final lastName = _lastNameController.text.trim();
            final favoriteLanguage = _favoriteLanguageController.text.trim();
            context.read<StudentCubit>().addStudent(
                  firstName: firstName,
                  lastName: lastName,
                  favoriteLanguage: favoriteLanguage,
                );

            _firstNameController.clear();
            _lastNameController.clear();
            _favoriteLanguageController.clear();
          },
          child: const Text('Envoyer'),
        ),
      ],
    );
  }
}
