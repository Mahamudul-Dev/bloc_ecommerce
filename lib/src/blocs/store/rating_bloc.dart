import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce/src/data/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/repository/product_repository.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  double rating = 0.0;
  final ProductRepository repository;

  RatingBloc(this.repository) : super(RatingInitial()) {
    on<UpdateRatingPoint>((event, emit) {
      rating = event.rating;
    });

    on<SubmitReveiw>((event, emit) async {
      emit(RatingLoading());
      final uid = FirebaseAuth.instance.currentUser?.uid;

      final review = ReviewModel(
        userId: uid,
        productId: event.productId,
        review: event.reveiw,
        rating: rating
      );
      try {
        final response = await repository.submitReveiwAndRating(review);

      if (response != null) {
        emit(RatingSubmitSuccess());
      } else {
        emit(const RatingSubmitFailed("Cant submit review"));
      }
      } catch (e) {
        emit(const RatingSubmitFailed("Internal Sarver Error"));
      }
    });
  }
}
