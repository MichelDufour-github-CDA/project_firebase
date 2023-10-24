import 'package:flutter/material.dart';
import 'package:project_firebase/models/student_model.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    super.key,
    required this.student,
  });

  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(student.firstName.toString()),
        const SizedBox(height: 10),
        Text(student.lastName.toString()),
        const SizedBox(height: 10),
        Text(student.favoriteLanguage.toString()),
      ]),
    );
  }
}
