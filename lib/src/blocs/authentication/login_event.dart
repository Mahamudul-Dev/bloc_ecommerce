part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{

  @override
  List<Object?> get props => [];
}

class RequestGoogleLogin extends LoginEvent {}

class RequestFacebookLogin extends LoginEvent {}

class RequestTwitterLogin extends LoginEvent {}

class RequestEmailLogin extends LoginEvent {
  final String email;
  final String password;
  final bool isRemember;
  RequestEmailLogin({
    required this.email,
    required this.password,
    required this.isRemember,
  });

  @override
  List<Object?> get props => [email, password, isRemember];
  
}

class RequestSignOut extends LoginEvent {}
