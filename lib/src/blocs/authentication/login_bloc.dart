import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../data/repository/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {

    on<RequestGoogleLogin>((event, emit) async {
      emit(LoginLoading());
      try{
        final user = await repository.signInWithGoogle();
        debugPrint('User: ${user?.displayName}');
        if(user != null){
          emit(LoginSuccess());
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(e.toString()));
      }
    });


    on<RequestFacebookLogin>((event, emit) async {
      emit(LoginLoading());
      try{
        final user = await repository.signInWithFacebook();
        debugPrint('User: ${user?.displayName}');
        if(user != null){
          emit(LoginSuccess());
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(LoginFailed(e.toString()));
      }
    });

    on<RequestTwitterLogin>((event, emit) async {
      emit(LoginLoading());
      try{
        final user = await repository.signInWithTwitter();
        debugPrint('User: ${user?.displayName}');
        if(user != null){
          emit(LoginSuccess());
        }
      } catch (e){
        debugPrint(e.toString());
      }
    });

    on<RequestEmailLogin>((event, emit) async {
      debugPrint("Email: ${event.email}, Password: ${event.password}, Remember: ${event.isRemember}");
     try {
        await repository.signInWithEmail(event.email, event.password).then((value) => emit(LoginSuccess()));

     } catch (e) {
       emit(LoginFailed(e.toString()));
     }
    });


    on<RequestSignOut>((event, emit) async {
      try {
        await repository.signoutUser().then((value) => emit(LogOutSuccess()));
      } catch (e) {
        emit(LogOutFailed(message: e.toString()));
      }
    });
  }
}
