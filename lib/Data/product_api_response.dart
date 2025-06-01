import 'package:e_commerce_app/Data/product_model.dart';

class ProductApiResponse {
  List<Product> urunler;
  int success;

  ProductApiResponse({required this.urunler, required this.success});

  factory ProductApiResponse.fromJSON(Map<String, dynamic> json) {
    var jsonArray = json["urunler"] as List;
    var success = json["success"] as int;

    var urunler =
        jsonArray.map((jsonObject) => Product.fromJSON(jsonObject)).toList();

    return ProductApiResponse(urunler: urunler, success: success);
  }
}
