import 'package:bloc/bloc.dart';
class WrapperCubit extends Cubit<int> {
  int activeIndex = 0;
  WrapperCubit() : super(0);

  void changeIndex(int index){
    activeIndex = index;
    emit(activeIndex);
  }
}
