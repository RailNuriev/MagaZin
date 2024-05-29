import 'package:flutter/material.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/favorites_screen.dart';
import 'models/cart.dart';
import 'models/product.dart';
import 'models/favorites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<CartState> cartKey = GlobalKey<CartState>();
  final GlobalKey<FavoritesState> favoritesKey = GlobalKey<FavoritesState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Магазин бытовой химии',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/registration',
      routes: {
        '/registration': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(cartKey: cartKey, favoritesKey: favoritesKey),
        '/product_detail': (context) => ProductDetailScreen(cartKey: cartKey, favoritesKey: favoritesKey),
        '/cart': (context) => CartScreen(cartKey: cartKey),
        '/profile': (context) => ProfileScreen(),
        '/favorites': (context) => FavoritesScreen(favoritesKey: favoritesKey),
      },
    );
  }
}
