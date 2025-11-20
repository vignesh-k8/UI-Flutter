import 'package:flutter/material.dart';

void main() {
  runApp(MyLayoutApp());
}

class MyLayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row, Column, and Stack Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Row Layout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, size: 40, color: Colors.blue),
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.settings, size: 40, color: Colors.green),
              ],
            ),
            SizedBox(height: 20),

            // Column Layout with Text and Image
            Column(
              children: [
                Text(
                  'Welcome to Flutter!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Image.network(
                  // 🔁 Updated to a valid image URL (old one returned 404)
                  'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
                  width: 100,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Stack Layout
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.orange,
                ),
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
