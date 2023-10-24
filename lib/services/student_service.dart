import 'package:project_firebase/data_sources/student_data_source.dart';
import 'package:project_firebase/models/student_model.dart';

abstract class StudentService {
  static Stream<List<StudentModel>> getStudents() =>
      StudentDataSource.getStudents().map(
        (data) => data.map((json) => StudentModel.fromJson(json)).toList(),
      );

  static Future<void> addStudent(StudentModel student) =>
      StudentDataSource.addStudent(student.toJson());
}
