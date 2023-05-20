import 'package:flutter/material.dart';
import 'package:mobile_shop_app/models/cart_item.dart';

class ProductScreen extends StatelessWidget {
  final List<CartItem> cartItems; // Declare the required argument

  const ProductScreen({super.key, required this.cartItems}); // Constructor to receive the required argument

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          cartItems.length, // Use the length of cartItems list
          (index) {
            return GestureDetector(
              onTap: () {
                // Handle product selection
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cartItems[index].name, // Use the name property of CartItem
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${cartItems[index].price}', // Use the price property of CartItem
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Handle add to cart button
                      },
                      child: const Text('Add to Cart'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
