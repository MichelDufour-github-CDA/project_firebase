part of 'authentication_cubit.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  unknow,
}

class AuthenticationState {
  final AuthenticationStatus status;
  final UserModel? currentUser;

  const AuthenticationState({
    required this.status,
    required this.currentUser,
  });
}
