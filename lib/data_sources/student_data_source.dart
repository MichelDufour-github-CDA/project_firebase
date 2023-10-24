import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_firebase/models/student_model.dart';

abstract class StudentDataSource {
  static Stream<List<StudentModel>> getStudents() {
    return FirebaseFirestore.instance.collection('students').snapshots().map(
          // Pour chaque version de la liste d'étudiants...
          (snapshot) => snapshot.docs
              .map(
                // Pour chaque étudiant (document) dans la dernière liste d'étudiants...
                (firebaseStudent) =>
                    // Je récupère la donnée brute de firebase
                    StudentModel.fromJson(
                  firebaseStudent.data(),
                ),
              )
              .toList(),
        );
  }
}
