part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductFetchSuccess extends ProductState {
  final List<ProductModel> products;

  const ProductFetchSuccess(this.products);

  @override
  List<Object> get props => [products];

}

final class ProductFetchFailed extends ProductState {
  final String message;

  const ProductFetchFailed(this.message);

  @override
  List<Object> get props => [message];
}


final class ProductLoadSuccess extends ProductState {
  final ProductModel product;

  const ProductLoadSuccess(this.product);

  @override
  List<Object> get props => [product];
}