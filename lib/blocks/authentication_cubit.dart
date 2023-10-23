import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_firebase/models/user_model.dart';
import 'package:project_firebase/services/authentication_service.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(
          const AuthenticationState(
            status: AuthenticationStatus.unknow,
            currentUser: null,
          ),
        );

  Future<void> register({
    required String email,
    required String password,
  }) async {
    await AuthenticationService.register(
      email: email,
      password: password,
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await AuthenticationService.login(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async => AuthenticationService.logout();

  void listenStatus() {
    AuthenticationService.getStatus().listen((user) {
      if (user == null) {
        emit(
          const AuthenticationState(
            status: AuthenticationStatus.unauthenticated,
            currentUser: null,
          ),
        );
      } else {
        emit(
          AuthenticationState(
            status: AuthenticationStatus.authenticated,
            currentUser: user,
          ),
        );
      }
    });
  }
}
