import 'package:flutter/material.dart';
import 'cart_item.dart';

class Cart extends StatefulWidget {
  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String productId, String name, double price) {
    setState(() {
      _items.add(CartItem(
        id: DateTime.now().toString(),
        productId: productId,
        name: name,
        price: price,
        quantity: 1,
      ));
    });
  }

  void removeItem(String id) {
    setState(() {
      _items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
