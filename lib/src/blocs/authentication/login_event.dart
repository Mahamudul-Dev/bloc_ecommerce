part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class RequestEmailLogin extends LoginEvent {
  final String email;
  final String password;
  RequestEmailLogin(this.email, this.password);
}


class RequestGoogleLogin extends LoginEvent {}