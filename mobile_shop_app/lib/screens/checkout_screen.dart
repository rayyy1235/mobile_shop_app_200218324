import 'package:flutter/material.dart';
import 'package:mobile_shop_app/screens/confirm_order_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final double totalCost;

  const CheckoutScreen({super.key, required this.totalCost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Phone Number:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConfirmOrderScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Total Cost: \$${totalCost.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
