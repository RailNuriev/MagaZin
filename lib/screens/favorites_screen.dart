import 'package:flutter/material.dart';
import '../models/favorites.dart';
import '../models/product.dart';

class FavoritesScreen extends StatelessWidget {
  final GlobalKey<FavoritesState> favoritesKey;

  FavoritesScreen({required this.favoritesKey});

  @override
  Widget build(BuildContext context) {
    final favoriteItems = favoritesKey.currentState?.favorites ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/product1.png'),
          ),
          title: Text(favoriteItems[i].name),
          subtitle: Text('${favoriteItems[i].price} руб'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              favoritesKey.currentState?.removeFavorite(favoriteItems[i]);
            },
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/product_detail',
              arguments: favoriteItems[i].id,
            );
          },
        ),
      ),
    );
  }
}
