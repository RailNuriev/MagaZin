import 'package:flutter/material.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  final GlobalKey<CartState> cartKey;

  CartScreen({required this.cartKey});

  @override
  Widget build(BuildContext context) {
    final cartItems = cartKey.currentState?.items ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/product1.png'),
          ),
          title: Text(cartItems[i].name),
          subtitle: Text('${cartItems[i].price} x ${cartItems[i].quantity}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              cartKey.currentState?.removeItem(cartItems[i].id);
            },
          ),
        ),
      ),
    );
  }
}
