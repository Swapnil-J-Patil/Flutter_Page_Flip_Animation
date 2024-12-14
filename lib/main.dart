import 'package:flutter/material.dart';
import 'package:newptoject/view/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;
  late Animation<double> _imageAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    );

    // Define the circle scaling animation (from 1x to 10x)
    _circleAnimation = Tween<double>(begin: 1.0, end: 30.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Define the image scaling animation (from 1x to 2x)
    _imageAnimation = Tween<double>(begin: 1.0, end: 2.3).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation and navigate to HomeScreen when done
    _controller.forward().whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    // Dispose the AnimationController to free resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // Black circle scaling animation
                Transform.scale(
                  scale: _circleAnimation.value,
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Image scaling animation
                Transform.scale(
                  scale: _imageAnimation.value,
                  child: Image.asset(
                    'images/logo.png', // Replace with your image path
                    width: 100, // Initial width of the image
                    height: 100, // Initial height of the image
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
