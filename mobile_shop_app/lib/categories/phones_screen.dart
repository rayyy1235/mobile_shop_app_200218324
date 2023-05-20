import 'package:flutter/material.dart';
import 'package:mobile_shop_app/screens/category_screen.dart';

class PhonesScreen extends StatelessWidget {
  const PhonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryScreen(category: 'phones');
    
  }
}
