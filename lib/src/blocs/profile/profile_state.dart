part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileFetchSuccess extends ProfileState {}
