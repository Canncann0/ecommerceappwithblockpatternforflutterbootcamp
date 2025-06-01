import 'package:e_commerce_app/Cubits/cart_cubit.dart';
import 'package:e_commerce_app/Cubits/detail_cubit.dart';
import 'package:e_commerce_app/Cubits/home_cubit.dart';
import 'package:e_commerce_app/Screens/Pages/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // List<String> imageNames = ["bilgisayar.png", "deodorant.png", "gozluk.png"];
    // String baseUrl = "http://kasimadalan.pe.hu/urunler/resimler/";

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => DetailCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
