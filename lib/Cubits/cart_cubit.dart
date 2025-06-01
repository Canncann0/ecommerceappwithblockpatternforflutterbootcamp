import 'package:e_commerce_app/Data/cart_model.dart';
import 'package:e_commerce_app/Data/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<CartModel>> {
  CartCubit() : super(<CartModel>[]);
  var repo = ProductRepository();

  Future<void> getProductfromCart(String kullaniciAdi) async {
    List<CartModel> cartList = await repo.getProductfromCart(kullaniciAdi);

    Map<String, CartModel> grouped = {};

    for (var item in cartList) {
      String key = item.ad + item.marka;

      if (grouped.containsKey(key)) {
        grouped[key] = CartModel(
          sepetId: item.sepetId,
          ad: item.ad,
          image: item.image,
          kategori: item.kategori,
          fiyat: item.fiyat,
          marka: item.marka,
          siparisAdeti: grouped[key]!.siparisAdeti + item.siparisAdeti,
          kullaniciAdi: kullaniciAdi,
        );
      } else {
        grouped[key] = item;
      }
    }

    emit(grouped.values.toList());
  }

  Future<void> deleteFromCart(int sepetId, String kullaniciAdi) async {
    await repo.deleteFromCart(sepetId, kullaniciAdi);
    await getProductfromCart(kullaniciAdi);
  }
}
