
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repository/repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  AuthRepository repository;
  SignupBloc(this.repository) : super(SignupInitial()) {
    
    
    on<RequestEmailSignUp>((event, emit) async {
      emit(SignUpLoading());
     try {
        await repository.signUpWithEmail(event.email, event.password, event.username);
      emit(SignUpSuccess());
     } catch (e) {
       emit(SignUpFailed(message: e.toString()));
     }
      
    });


  }
}
