import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreensScreen(category: category),
                ),
              );
            },
            child: const CategoryBox(
              title: 'Screens',
              color: Colors.blue,
              image: AssetImage('lib/assets/monitor.png'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhonesScreen(category: category),
                ),
              );
            },
            child: const CategoryBox(
              title: 'Phones',
              color: Colors.orange,
              image: AssetImage('lib/assets/phone.png'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LaptopsScreen(category: category),
                ),
              );
            },
            child: const CategoryBox(
              title: 'Laptops',
              color: Colors.green,
              image: AssetImage('lib/assets/laptop.png'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeadphonesScreen(category: category),
                ),
              );
            },
            child: const CategoryBox(
              title: 'Headphones',
              color: Colors.purple,
              image: AssetImage('lib/assets/headphone.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String title;
  final Color color;
  final ImageProvider image;

  const CategoryBox({super.key, required this.title, required this.color, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: image,
            height: 80.0,
            width: 80.0,
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ScreensScreen extends StatelessWidget {
  final String category;

  const ScreensScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: const Center(
        child: Text(
          'Screens',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class PhonesScreen extends StatelessWidget {
  final String category;

  const PhonesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: const Center(
        child: Text(
          'Phones',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class LaptopsScreen extends StatelessWidget {
  final String category;

  const LaptopsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: const Center(
        child: Text(
          'Laptops',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class HeadphonesScreen extends StatelessWidget {
  final String category;

  const HeadphonesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: const Center(
        child: Text(
          'Headphones',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
