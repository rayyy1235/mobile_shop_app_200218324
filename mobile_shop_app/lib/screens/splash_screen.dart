import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_shop_app/screens/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _animationController.forward();

    // Delay for 3 seconds and then navigate to the login screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background GIF Image
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Image.asset(
                  'lib/assets/cart.gif',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              );
            },
          ),
          // Fade and Scale Animation
          FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              color: Colors.black.withOpacity(0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Loading Spinner
                  SpinKitCircle(
                    color: Colors.white,
                    size: 50.0,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
