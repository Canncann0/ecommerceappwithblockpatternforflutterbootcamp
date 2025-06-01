import 'package:e_commerce_app/Data/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCubit extends Cubit<void> {
  DetailCubit() : super(0);
  var repo = ProductRepository();

  Future<void> addToCart(
    String ad,
    String resim,
    String kategori,
    int fiyat,
    String marka,
    int productPiece,
    String kullaniciAdi,
  ) async {
    await repo.addToCart(
      ad,
      resim,
      kategori,
      fiyat,
      marka,
      productPiece,
      kullaniciAdi,
    );
  }
}
