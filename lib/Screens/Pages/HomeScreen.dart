import 'package:e_commerce_app/Cubits/home_cubit.dart';
import 'package:e_commerce_app/Data/product_model.dart';
import 'package:e_commerce_app/Screens/SubPages/ProductDetailScreen.dart';
import 'package:e_commerce_app/Widgets/Product_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadProducts();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeCubit, List<Product>>(
              builder: (context, productList) {
                if (productList.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(
                        top: 24,
                        left: 8,
                        right: 8,
                        bottom: 24,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        final product = productList[index];
                        String baseUrl =
                            "http://kasimadalan.pe.hu/urunler/resimler/";
                        String imageUrl =
                            "$baseUrl${normalize(product.ad)}.png";
                        return ProductCard(
                          product: product,
                          imageUrl: imageUrl,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return FractionallySizedBox(
                                  heightFactor: 0.95, //
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                      child: ProductDetailScreen(
                                        product: product,
                                        imageUrl: imageUrl,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
