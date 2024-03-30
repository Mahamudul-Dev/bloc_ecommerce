import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';
import '../../data/repository/repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  StoreRepository repository;
  CategoryBloc(this.repository) : super(CategoryInitial()) {
    
    
    on<FetchSingleCategory>((event, emit) async{
     try {
       final category = await repository.fetchSingleCategory(event.categoryId);
       if(category != null){
        emit(CategoryFetchSucces(category));
       } else {
        emit(const CategoryFetchFailed('Category not found'));
       }
     } catch (e) {
       emit(const CategoryFetchFailed('Unable to get category'));
     }
    });

    
  }
}
