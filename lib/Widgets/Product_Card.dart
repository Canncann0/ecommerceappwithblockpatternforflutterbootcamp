import 'package:e_commerce_app/Data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final String imageUrl;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    //var screenHeight = MediaQuery.of(context).size.height;
    //var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(imageUrl, fit: BoxFit.contain),
                ),
                Container(
                  //height: 32,
                  color: Colors.black,
                  //height: 32,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text(
                      product.kategori,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
              child: Row(
                children: [
                  Text(
                    product.ad,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " "
                    "-"
                    " ",
                  ),
                  Text(
                    product.marka,

                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${product.fiyat}₺",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
