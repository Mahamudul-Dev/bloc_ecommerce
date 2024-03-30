part of 'remember_switch_cubit.dart';

@immutable
abstract class RememberSwitchState extends Equatable{
  @override
  List<Object?> get props => [];
}

class RememberSwitchInitial extends RememberSwitchState {}

class SwitchChanged extends RememberSwitchState {
  final bool value;
  SwitchChanged(this.value);

  @override
  List<Object?> get props => [value];

}
