import 'package:flutter/material.dart';
import 'package:mobile_shop_app/screens/splash_screen.dart';


void main()  {

  runApp(const MobileShopApp());
}

class MobileShopApp extends StatelessWidget {
  const MobileShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Shop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
