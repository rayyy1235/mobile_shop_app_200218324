import 'package:flutter/material.dart';
import 'package:mobile_shop_app/screens/checkout_screen.dart';
import 'package:mobile_shop_app/screens/home_screen.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartScreen({Key? key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalCost = cartItems.fold(0, (sum, item) => sum + (item.product.price * item.count));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                CartItem cartItem = cartItems[index];

                return ListTile(
                  leading: cartItem.product.image != null
                      ? Image.asset(
                          cartItem.product.image!,
                          height: 60.0,
                          width: 60.0,
                        )
                      : const SizedBox.shrink(),
                  title: Text(cartItem.product.name),
                  subtitle: Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Decrease quantity
                          // Add your logic here to decrement the quantity of the product
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text('${cartItem.count}'),
                      IconButton(
                        onPressed: () {
                          // Increase quantity
                          // Add your logic here to increment the quantity of the product
                        },
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          // Remove from cart
                          // Add your logic here to remove the product from the cart
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Cost:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${totalCost.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutScreen(totalCost: totalCost)),
                    );
                  },
                  child: const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
