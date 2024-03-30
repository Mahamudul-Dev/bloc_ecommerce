part of 'brand_bloc.dart';

sealed class BrandState extends Equatable {
  const BrandState();
  
  @override
  List<Object> get props => [];
}

final class BrandInitial extends BrandState {}

final class BrandFetchSuccess extends BrandState {
  final List<BrandModel> brands;

  const BrandFetchSuccess(this.brands);
  @override
  List<Object> get props => [brands];

}


final class BrandFetchFailed extends BrandState {
  final String message;

  const BrandFetchFailed(this.message);

  @override
  List<Object> get props => [message];
}