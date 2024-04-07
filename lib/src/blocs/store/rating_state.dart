part of 'rating_bloc.dart';

sealed class RatingState extends Equatable {
  const RatingState();
  
  @override
  List<Object> get props => [];
}

final class RatingInitial extends RatingState {
  final TextEditingController reveiwController = TextEditingController();
}

final class RatingLoading extends RatingState {}


final class RatingSubmitSuccess extends RatingState {}


final class RatingSubmitFailed extends RatingState {
  final String message;

  const RatingSubmitFailed(this.message);
  @override
  List<Object> get props => [message];
}

