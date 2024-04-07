part of 'rating_bloc.dart';

sealed class RatingEvent extends Equatable {
  const RatingEvent();

  @override
  List<Object> get props => [];
}

final class UpdateRatingPoint extends RatingEvent {
  final double rating;

  const UpdateRatingPoint(this.rating);

  @override
  List<Object> get props => [rating];
}

final class SubmitReveiw extends RatingEvent {
  final String reveiw;
  final String productId;

  const SubmitReveiw(this.reveiw, this.productId);

  @override
  List<Object> get props => [reveiw, productId];
}
