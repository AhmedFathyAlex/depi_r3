// import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class Authenticated extends AuthState {
  // UserCredential user;
  // Authenticated({required this.user});
}

class Unauthenticated extends AuthState {}
class Loading extends AuthState {}
class Error extends AuthState {

final String message;
  Error(this.message);

}


