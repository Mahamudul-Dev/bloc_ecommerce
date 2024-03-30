part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryFetchSucces extends CategoryState {
  final CategoryModel category;

  const CategoryFetchSucces(this.category);

  @override
  List<Object> get props => [category];
}

final class CategoryFetchFailed extends CategoryState {
  final String message;

  const CategoryFetchFailed(this.message);

  @override
  List<Object> get props => [message];

}