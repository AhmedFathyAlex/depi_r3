abstract class AuthEvent {}
class LoginEvent extends AuthEvent{
final String email;
  final String password;
  LoginEvent(this.email, this.password);
}
class LogoutEvent extends AuthEvent{}
class SignupEvent extends AuthEvent{

final String email;
  final String password;
  SignupEvent(this.email, this.password);

}