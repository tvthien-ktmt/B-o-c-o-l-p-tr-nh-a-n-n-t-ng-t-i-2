import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          Image.network(product.imageUrl, height: 250, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Text(product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(product.category.name),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text("Thêm vào giỏ"),
            onPressed: () {
              cart.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đã thêm vào giỏ hàng')),
              );
            },
          ),
        ],
      ),
    );
  }
}
