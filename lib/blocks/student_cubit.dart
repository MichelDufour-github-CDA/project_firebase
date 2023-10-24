import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_firebase/models/student_model.dart';
import 'package:project_firebase/services/student_service.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentStateInitial());

  Future<void> getStudents() async {
    emit(StudentStateLoading());
    try {
      StudentService.getStudents().listen((students) {
        emit(StudentStateLoaded(students: students));
      });
    } catch (e) {
      emit(StudentStateError(message: e.toString()));
    }
  }
}
