part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class FetchProfileData extends ProfileEvent {}