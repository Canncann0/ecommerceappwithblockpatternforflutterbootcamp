import 'package:e_commerce_app/Cubits/cart_cubit.dart';
import 'package:e_commerce_app/Data/cart_model.dart';
import 'package:e_commerce_app/Widgets/Cart_Item_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartState();
}

class _CartState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getProductfromCart("dogancan");
  }

  String normalize(String input) {
    return input
        .toLowerCase()
        .replaceAll(' ', '')
        .replaceAll('ç', 'c')
        .replaceAll('ğ', 'g')
        .replaceAll('ı', 'i')
        .replaceAll('ö', 'o')
        .replaceAll('ş', 's')
        .replaceAll('ü', 'u');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        title: Text("Sepetim"),
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 20,
        shadowColor: Colors.black26,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartCubit, List<CartModel>>(
              builder: (context, cartList) {
                if (cartList.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        final cart = cartList[index];
                        String baseUrl =
                            "http://kasimadalan.pe.hu/urunler/resimler/";
                        String imageUrl = "$baseUrl${normalize(cart.ad)}.png";
                        return CartItemCard(
                          cartModel: cart,
                          imageUrl: imageUrl,
                        );
                      },
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined, size: 36),
                      SizedBox(height: 24),
                      Text(
                        "Sepetinizde Ürün Yok",
                        style: GoogleFonts.plusJakartaSans(fontSize: 24),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          textStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text("Alışveriş Yap"),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
