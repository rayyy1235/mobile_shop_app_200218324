import 'package:flutter/material.dart';
import 'package:mobile_shop_app/screens/category_screen.dart';

class LaptopsScreen extends StatelessWidget {
  const LaptopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryScreen(category: 'laptops');
  }
}
