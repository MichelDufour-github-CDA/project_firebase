import 'package:cloud_firestore/cloud_firestore.dart';

abstract class StudentDataSource {
  static Stream<List<Map<String, dynamic>>> getStudents() {
    return FirebaseFirestore.instance.collection('students').snapshots().map(
          // Pour chaque version de la liste d'étudiants...
          (snapshot) => snapshot.docs
              .map(
                // Pour chaque étudiant (document) dans la dernière liste d'étudiants...
                (firebaseStudent) =>
                    // Je récupère la donnée brute de firebase
                    firebaseStudent.data(),
              )
              .toList(),
        );
  }

  static Future<void> addStudent(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection('students').add(data);
  }
}
