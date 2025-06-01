import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/Data/cart_api_response.dart';
import 'package:e_commerce_app/Data/cart_model.dart';
import 'package:e_commerce_app/Data/product_api_response.dart';
import 'package:e_commerce_app/Data/product_model.dart';

class ProductRepository {
  List<Product> parseProducts(String response) {
    return ProductApiResponse.fromJSON(json.decode(response)).urunler;
  }

  List<CartModel> parseCartItem(String response) {
    try {
      var decoded = json.decode(response);
      return CartApiResponse.fromJSON(decoded).urunler_sepeti;
    } catch (e) {
      print("Sepet JSON parse hatası: $e");
      return [];
    }
  }

  Future<List<Product>> loadProducts() async {
    var url = "http://kasimadalan.pe.hu/urunler/tumUrunleriGetir.php";
    var response = await Dio().get(url);
    return parseProducts(response.data.toString());
  }

  Future<void> addToCart(
    String ad,
    String resim,
    String kategori,
    int fiyat,
    String marka,
    int productPiece,
    String kullaniciAdi,
  ) async {
    var url = "http://kasimadalan.pe.hu/urunler/sepeteUrunEkle.php";
    var data = {
      "ad": ad,
      "resim": resim,
      "kategori": kategori,
      "fiyat": fiyat,
      "marka": marka,
      "siparisAdeti": productPiece,
      "kullaniciAdi": kullaniciAdi,
    };
    var response = await Dio().post(url, data: FormData.fromMap(data));
  }

  Future<List<CartModel>> getProductfromCart(String kullaniciAdi) async {
    var url = "http://kasimadalan.pe.hu/urunler/sepettekiUrunleriGetir.php";
    var data = {"kullaniciAdi": kullaniciAdi};
    var response = await Dio().post(url, data: FormData.fromMap(data));

    print("API'den gelen cart JSON: ${response.data}");

    return parseCartItem(response.data.toString());
  }

  Future<void> deleteFromCart(int sepetId, String kullaniciAdi) async {
    var url = "http://kasimadalan.pe.hu/urunler/sepettenUrunSil.php";
    var data = {"sepetId": sepetId, "kullaniciAdi": kullaniciAdi};
    var response = await Dio().post(url, data: FormData.fromMap(data));
  }
}
