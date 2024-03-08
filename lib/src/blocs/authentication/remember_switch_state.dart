part of 'remember_switch_cubit.dart';

@immutable
abstract class RememberSwitchState {}

class RememberSwitchInitial extends RememberSwitchState {}

class SwitchChanged extends RememberSwitchState {
  final bool value;
  SwitchChanged(this.value);
}
