import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart.dart';
import '../models/favorites.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<CartState> cartKey;
  final GlobalKey<FavoritesState> favoritesKey;

  HomeScreen({required this.cartKey, required this.favoritesKey});

  final List<Product> products = [
    Product(
      id: '0',
      name: 'Средство для мытья посуды',
      description: 'Эффективное средство для мытья посуды',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 150.0,
    ),
    Product(
      id: '1',
      name: 'Моющее средство для стекол',
      description: 'Чистота и блеск для ваших окон',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 200.0,
    ),
    Product(
      id: '2',
      name: 'Средство для чистки ковров',
      description: 'Глубокая чистка и уход за коврами',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 300.0,
    ),
    Product(
      id: '3',
      name: 'Универсальное чистящее средство',
      description: 'Для уборки всех поверхностей',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 120.0,
    ),
    Product(
      id: '4',
      name: 'Стиральный порошок',
      description: 'Высокая эффективность стирки',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 250.0,
    ),
    Product(
      id: '5',
      name: 'Кондиционер для белья',
      description: 'Нежная забота о ваших вещах',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 90.0,
    ),
    Product(
      id: '6',
      name: 'Освежитель воздуха',
      description: 'Свежесть и аромат в вашем доме',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 50.0,
    ),
    Product(
      id: '7',
      name: 'Чистящее средство для кухни',
      description: 'Для чистоты на вашей кухне',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 70.0,
    ),
    Product(
      id: '8',
      name: 'Средство для чистки ванной',
      description: 'Эффективная чистка ванной комнаты',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 80.0,
    ),
    Product(
      id: '9',
      name: 'Моющее средство для пола',
      description: 'Для блестящих полов',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 110.0,
    ),
    Product(
      id: '10',
      name: 'Гель для стирки',
      description: 'Глубокое очищение тканей',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 130.0,
    ),
    Product(
      id: '11',
      name: 'Дезинфицирующее средство',
      description: 'Уничтожает 99.9% бактерий',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 140.0,
    ),
    Product(
      id: '12',
      name: 'Средство для чистки мебели',
      description: 'Для блеска и защиты мебели',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 170.0,
    ),
    Product(
      id: '13',
      name: 'Антибактериальное средство',
      description: 'Для безопасности вашего дома',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 180.0,
    ),
    Product(
      id: '14',
      name: 'Средство для чистки окон',
      description: 'Чистота и прозрачность стекол',
      images: [
        'assets/images/product1.png',
        'assets/images/product2.png',
      ],
      price: 90.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final registeredName = args['name'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Магазин бытовой химии'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile', arguments: {'name': registeredName});
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductItem(product: products[i], cartKey: cartKey, favoritesKey: favoritesKey),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final GlobalKey<CartState> cartKey;
  final GlobalKey<FavoritesState> favoritesKey;

  ProductItem({required this.product, required this.cartKey, required this.favoritesKey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product_detail',
          arguments: product.id,
        );
      },
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/product_detail',
                    arguments: product.id,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(product.images[0], fit: BoxFit.cover),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.66,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '${product.price} руб',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add_shopping_cart, color: Colors.blue),
                            onPressed: () {
                              cartKey.currentState?.addItem(product.id, product.name, product.price);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Товар добавлен в корзину'),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              favoritesKey.currentState?.addFavorite(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Товар добавлен в избранное'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
