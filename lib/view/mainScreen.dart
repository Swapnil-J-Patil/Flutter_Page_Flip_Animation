import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final int page;
  final String imageUrl;

  const MainScreen({Key? key, required this.page, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png', // Replace with the name of your image file
                  width: 50,               // Set desired width
                  height: 50,              // Set desired height
                ),
                SizedBox(width: 10),
                Text(
                  "Meme #${page + 1}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            // Text("Target 500 memes",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            SizedBox(height: 30),
            Image.network(
              height: 300,
              width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitHeight,
                imageUrl), // Display the passed meme image
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
