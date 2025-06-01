import 'package:e_commerce_app/Cubits/cart_cubit.dart';
import 'package:e_commerce_app/Data/cart_model.dart';
import 'package:e_commerce_app/Screens/Pages/FavoriteScreen.dart';
import 'package:e_commerce_app/Screens/Pages/HomeScreen.dart';
import 'package:e_commerce_app/Screens/Pages/ProfileScreen.dart';
import 'package:e_commerce_app/Screens/SubPages/CartScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;
  final List pages = [HomeScreen(), ProfileScreen(), Favoritescreen()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF3F3F3),
      appBar: AppBar(
        title: Text(
          "Shoplay",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          BlocBuilder<CartCubit, List<CartModel>>(
            builder: (context, cartItems) {
              int itemCount = cartItems.fold(
                0,
                (sum, item) => sum + item.siparisAdeti,
              );

              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: -2, end: 4),
                showBadge: itemCount > 0,
                badgeContent: Text(
                  itemCount.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                badgeStyle: badges.BadgeStyle(badgeColor: Colors.redAccent),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              );
            },
          ),
        ],
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 20,
        shadowColor: Colors.black26,
      ),
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentPageIndex,
        onTap: (index) {
          currentPageIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
