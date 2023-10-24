import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_firebase/blocks/student_cubit.dart';
import 'package:project_firebase/presentation/widgets/student_card.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        if (state is StudentStateLoading) {
          // Chargement
          return const Center(child: CircularProgressIndicator());
        }
        if (state is StudentStateLoaded) {
          // Chargé avec succès
          final students = state.students;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: students.length,
            itemBuilder: (context, index) => StudentCard(
              student: students.elementAt(index),
            ),
          );
        }
        if (state is StudentStateError) {
          return ColoredBox(
            color: Colors.red,
            child: Text(state.message),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
