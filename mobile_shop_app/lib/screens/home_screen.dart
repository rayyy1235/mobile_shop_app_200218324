import 'package:flutter/material.dart';
import 'package:mobile_shop_app/screens/cart_screen.dart';
import 'package:mobile_shop_app/screens/category_screen.dart';
import 'package:mobile_shop_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  // List of products
  List<Product> products = [
    Product(name: 'Iphone X', price: 1000, image: 'lib/assets/iphone.png', details: 'Some details about iPhone X'),
    Product(name: 'Samsung 32 inch monitor', price: 600, image: 'lib/assets/samsung.png', details: 'Some details about Samsung monitor'),
    Product(name: 'Beats 3 Headphones', price: 250, image: 'lib/assets/beats.png', details: 'Some details about Beats headphones'),
    Product(name: 'Lenovo Y520 laptop', price: 2000, image: 'lib/assets/lenovo.png', details: 'Some details about Lenovo laptop'),
    Product(name: 'Macbook pro', price: 4500, image: 'lib/assets/macbookpro.png', details: 'Some details about MacBook Pro'),
    Product(name: 'Airpods pro', price: 600.0, image: 'lib/assets/airpodspro.png', details: 'Some details about Airpods Pro'),
    Product(name: 'Iphone 12', price: 1300, image: 'lib/assets/iphone12.png', details: 'Some details about iPhone 12'),
    Product(name: 'Airpods', price: 300, image: 'lib/assets/airpods.png', details: 'Some details about Airpods'),
  ];

  // Cart items
  List<CartItem> cartItems = [];

  // Animation controller and animations
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Function to add product to cart
  void _addToCart(Product product) {
    setState(() {
      // Check if the product is already in the cart
      int index = cartItems.indexWhere((item) => item.product == product);

      if (index != -1) {
        // Product already exists in the cart, increase the count
        cartItems[index].count++;
      } else {
        // Product does not exist in the cart, add it
        cartItems.add(CartItem(product: product, count: 1));
      }
    });
  }

  // Function to remove product from cart
  void _removeFromCart(Product product) {
    setState(() {
      // Find the product in the cart
      int index = cartItems.indexWhere((item) => item.product == product);

      if (index != -1) {
        // Decrease the count
        cartItems[index].count--;

        // Remove the product if the count reaches 0
        if (cartItems[index].count == 0) {
          cartItems.removeAt(index);
        }
      }
    });
  }

  // Function to animate the button
  void _animateButton() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.category),
            onPressed: () {
              // Navigate to the category screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryScreen(category: '')),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigate to the home screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                // Navigate to the category screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryScreen(category: '')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Navigate to the profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Perform logout action
                // ...
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                bool isInCart = cartItems.any((item) => item.product == product);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product)),
                    );
                  },
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                          if (product.image != null) // Check if the product has an image
                            Image.asset(
                              product.image!,
                              height: 100.0,
                              width: 100.0,
                              fit: BoxFit.cover,
                            ),
                          const SizedBox(height: 8.0),
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 12.0),
                          ),
                          const SizedBox(height: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              if (isInCart) {
                                _removeFromCart(product);
                              } else {
                                _addToCart(product);
                              }
                              _animateButton();
                            },
                            child: isInCart ? const Icon(Icons.remove_shopping_cart) : const Icon(Icons.add_shopping_cart),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cartItems: cartItems)),
              );
            },
            child: Text('View Cart (${cartItems.length})'),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String? image;
  final String details;

  Product({
    required this.name,
    required this.price,
    this.image,
    required this.details,
  });
}

class CartItem {
  final Product product;
  int count;

  CartItem({
    required this.product,
    required this.count,
  });
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.image != null) // Check if the product has an image
              Image.asset(
                product.image!,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16.0),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Details:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              product.details,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
