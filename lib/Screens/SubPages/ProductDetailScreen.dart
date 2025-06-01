import 'package:e_commerce_app/Cubits/detail_cubit.dart';
import 'package:e_commerce_app/Screens/SubPages/CartScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/Data/product_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final String imageUrl;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.imageUrl,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isAddedToCart = false;
  int productPiece = 1;
  String kullaniciAdi = "dogancan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Container(
                  color: Color(0XFFF3F3F3),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Custom AppBar
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          child: SizedBox(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    widget.product.ad,
                                    style: GoogleFonts.plusJakartaSans(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => Icon(Icons.broken_image),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.product.ad,
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              " "
                              "-"
                              " ",
                            ),
                            Text(
                              widget.product.marka,
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      // Text("Fiyat: ${product.fiyat ?? 0} ₺"),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16,

                          bottom: 24,
                        ),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Purus proin gravida a nibh praesent. In morbi ridiculus sed gravida quam vitae. Donec convallis orci consectetur at urna euismod arcu sed. Ultrices nec venenatis elit auctor quam ipsum in dolor diam.",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(color: Colors.grey),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8,
                                  ),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Row(
                              children: [
                                IconButton.outlined(
                                  onPressed: () {
                                    if (productPiece > 1) {
                                      productPiece--;
                                      setState(() {});
                                    }
                                  },
                                  icon: Icon(Icons.remove),
                                  style: IconButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    side: const BorderSide(color: Colors.black),
                                    fixedSize: const Size(20, 20),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "$productPiece",
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                IconButton.outlined(
                                  onPressed: () {
                                    productPiece++;
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.add),
                                  style: IconButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    side: const BorderSide(color: Colors.black),
                                    fixedSize: const Size(20, 20),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Text("Kategori: ${product.kategori ?? "Bilinmiyor"}"),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.product.fiyat * productPiece} ₺",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 48,
              width: 240,
              child: ElevatedButton(
                onPressed: () async {
                  if (!isAddedToCart) {
                    await context.read<DetailCubit>().addToCart(
                      widget.product.ad,
                      widget.product.image,
                      widget.product.kategori,
                      widget.product.fiyat,
                      widget.product.marka,
                      productPiece,
                      kullaniciAdi,
                    );
                    setState(() {
                      isAddedToCart = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Ürün Sepete Eklendi"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.black,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    ).then((_) {
                      isAddedToCart = false;
                      setState(() {});
                    });
                  }
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
                child: Text(isAddedToCart ? "Sepete Git   (1)" : "Sepete Ekle"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
