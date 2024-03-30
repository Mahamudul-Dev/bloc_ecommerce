part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class FetchProduct extends ProductEvent {}

class FetchSingleProduct extends ProductEvent {
  final String productId;
  const FetchSingleProduct(this.productId);

  @override
  List<Object> get props => [productId];
}

