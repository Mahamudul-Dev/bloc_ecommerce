import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce/src/data/repository/store_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  StoreRepository repository = StoreRepository();

  void startSplash() {
    Future.delayed(const Duration(seconds: 2), (){
      emit(SplashEnd());
    });
  }
}
