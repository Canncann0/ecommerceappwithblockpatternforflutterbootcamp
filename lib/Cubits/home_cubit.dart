import 'package:e_commerce_app/Data/product_model.dart';
import 'package:e_commerce_app/Data/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<Product>> {
  HomeCubit() : super(<Product>[]);
  var repo = ProductRepository();

  Future<void> loadProducts() async {
    var list = await repo.loadProducts();
    emit(list);
  }
}
