part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}


final class FetchAllCategory extends CategoryEvent {}


final class FetchSingleCategory extends CategoryEvent {
  final String categoryId;

  const FetchSingleCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}