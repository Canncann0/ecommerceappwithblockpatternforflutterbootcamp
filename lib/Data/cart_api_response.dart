import 'package:e_commerce_app/Data/cart_model.dart';

class CartApiResponse {
  List<CartModel> urunler_sepeti;
  int success;

  CartApiResponse({required this.urunler_sepeti, required this.success});

  factory CartApiResponse.fromJSON(Map<String, dynamic> json) {
    var jsonArray = json["urunler_sepeti"];

    List<CartModel> urunlerSepeti = [];

    if (jsonArray != null && jsonArray is List) {
      urunlerSepeti =
          jsonArray
              .map((jsonObject) => CartModel.fromJSON(jsonObject))
              .toList();
    }

    var success = int.tryParse(json["success"].toString()) ?? 0;

    return CartApiResponse(urunler_sepeti: urunlerSepeti, success: success);
  }
}
