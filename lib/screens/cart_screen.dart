import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛒 Giỏ hàng'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: cart.exportJson,
          ),
        ],
      ),
      body: cart.items.isEmpty
          ? const Center(child: Text('Giỏ hàng trống'))
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            leading: Image.network(item.product.imageUrl, width: 50),
            title: Text(item.product.name),
            subtitle: Text('x${item.quantity} • \$${item.product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => cart.removeFromCart(item.product),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.blueAccent.withOpacity(0.1),
        child: Text(
          'Tổng: \$${cart.total.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
