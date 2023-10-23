import 'package:project_firebase/data_sources/authentication_data_source.dart';
import 'package:project_firebase/models/user_model.dart';

abstract class AuthenticationService {
  static Future<void> register({
    required String email,
    required String password,
  }) =>
      AuthenticationDataSource.register(
        email: email,
        password: password,
      );

  static Future<void> login({
    required String email,
    required String password,
  }) =>
      AuthenticationDataSource.login(
        email: email,
        password: password,
      );

  static Future<void> logout() => AuthenticationDataSource.logout();

  static Stream<UserModel?> getStatus() => AuthenticationDataSource.getStatus();
}
