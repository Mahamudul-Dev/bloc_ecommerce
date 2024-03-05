part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class RequestGoogleLogin extends LoginEvent {}

class RequestFacebookLogin extends LoginEvent {}

class RequestTwitterLogin extends LoginEvent {}