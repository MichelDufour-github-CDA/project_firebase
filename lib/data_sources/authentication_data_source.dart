import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_firebase/models/user_model.dart';

abstract class AuthenticationDataSource {
  static Future<void> register({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Stream<UserModel?> getStatus() {
    return FirebaseAuth.instance.authStateChanges().map((firebaseUser) {
      if (firebaseUser != null) {
        return UserModel(email: firebaseUser.email);
      }
      return null;
    });
  }
}
