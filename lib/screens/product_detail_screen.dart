import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart.dart';
import '../models/favorites.dart';

class ProductDetailScreen extends StatelessWidget {
  final GlobalKey<CartState> cartKey;
  final GlobalKey<FavoritesState> favoritesKey;

  ProductDetailScreen({required this.cartKey, required this.favoritesKey});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final product = _findProductById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: PageView(
                children: product.images
                    .map((image) => Image.asset(image, fit: BoxFit.cover))
                    .toList(),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${product.price} руб',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                cartKey.currentState?.addItem(product.id, product.name, product.price);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Товар добавлен в корзину'),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Добавить в корзину'),
            ),
          ],
        ),
      ),
    );
  }

  Product _findProductById(String id) {
    final products = List.generate(
      15,
          (index) => Product(
        id: index.toString(),
        name: 'Продукт $index',
        description: 'Описание продукта $index',
        images: [
          'assets/images/product1.png',
          'assets/images/product2.png',
        ],
        price: 150.0 + index * 10,
      ),
    );
    return products.firstWhere((prod) => prod.id == id);
  }
}
