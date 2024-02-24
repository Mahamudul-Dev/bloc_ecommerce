import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startSplash(){
    Future.delayed(const Duration(seconds: 2), (){
      emit(SplashEnd());
    });
  }
}
