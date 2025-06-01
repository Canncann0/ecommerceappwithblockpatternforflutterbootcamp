import 'package:e_commerce_app/Cubits/cart_cubit.dart';
import 'package:e_commerce_app/Data/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemCard extends StatefulWidget {
  final CartModel cartModel;
  final String imageUrl;
  const CartItemCard({
    super.key,
    required this.cartModel,
    required this.imageUrl,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  late int productPiece;

  @override
  void initState() {
    super.initState();
    productPiece = widget.cartModel.siparisAdeti;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        height: 144,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    color: Colors.grey.shade100,
                    height: 128,
                    width: 128,
                    child: Image.network(widget.imageUrl, fit: BoxFit.contain),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8),
                          child: Row(
                            children: [
                              Text(
                                widget.cartModel.ad,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(" - "),
                              Text(
                                widget.cartModel.marka,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 32),
                          child: Text(
                            "${widget.cartModel.fiyat * productPiece}₺",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (productPiece > 1) {
                                    productPiece--;
                                  }
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down),
                            ),
                            Text(
                              "${(productPiece)}",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  productPiece++;
                                });
                              },
                              icon: Icon(Icons.arrow_drop_up),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(),
                  ],
                ),
              ],
            ),

            IconButton(
              onPressed: () {
                context.read<CartCubit>().deleteFromCart(
                  widget.cartModel.sepetId,
                  widget.cartModel.kullaniciAdi,
                );
              },
              icon: Icon(Icons.delete, size: 24, color: Colors.red.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
