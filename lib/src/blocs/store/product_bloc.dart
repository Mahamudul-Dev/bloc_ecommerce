import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';
import '../../data/repository/repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository repository;
  ProductBloc(this.repository) : super(ProductInitial()) {
    
    
    on<FetchProduct>((event, emit) async {
      try {
          final products = await repository.fetchProduct();
          emit(ProductFetchSuccess(products));
        } catch (e) {
          emit(const ProductFetchFailed('Failed to load products'));
        }
    });


    on<FetchSingleProduct>((event, emit) async {
      try {
        final product = await repository.fetchSingleProduct(event.productId);

        if(product != null){
          emit(ProductLoadSuccess(product));
        } else {
          emit(const ProductFetchFailed('Unble to load product from server'));
        }

      } catch (e) {
        emit(const ProductFetchFailed('Failed to load products'));
      }
    });
  }
}
