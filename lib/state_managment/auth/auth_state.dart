abstract class AuthState {}
class Authenticated extends AuthState {}
class Unauthenticated extends AuthState {}
class Loadig extends AuthState {}
class Error extends AuthState {

final String message;
  Error(this.message);

}


