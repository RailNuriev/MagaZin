import 'package:flutter/material.dart';
import 'product.dart';

class Favorites extends StatefulWidget {
  @override
  FavoritesState createState() => FavoritesState();
}

class FavoritesState extends State<Favorites> {
  final List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  void addFavorite(Product product) {
    setState(() {
      _favorites.add(product);
    });
  }

  void removeFavorite(Product product) {
    setState(() {
      _favorites.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
