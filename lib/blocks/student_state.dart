part of 'student_cubit.dart';

abstract class StudentState {
  const StudentState();
}

class StudentStateInitial extends StudentState {}

class StudentStateLoading extends StudentState {}

class StudentStateLoaded extends StudentState {
  final List<StudentModel> students;

  const StudentStateLoaded({required this.students});
}

class StudentStateError extends StudentState {
  final String message;

  const StudentStateError({required this.message});
}
