import 'package:flutter/material.dart';

void main() {
  runApp(ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Responsive UI'),
        ),
        body: ResponsiveHomePage(),
      ),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Mobile Layout
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_android, size: 80, color: Colors.blue),
            Text("Mobile Layout", style: TextStyle(fontSize: 24)),
          ],
        ),
      );
    } else if (screenWidth < 1200) {
      // Tablet Layout
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.tablet, size: 80, color: Colors.green),
            SizedBox(width: 20),
            Text("Tablet Layout", style: TextStyle(fontSize: 28)),
          ],
        ),
      );
    } else {
      // Desktop Layout
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.desktop_windows, size: 80, color: Colors.purple),
            SizedBox(width: 20),
            Text("Desktop Layout", style: TextStyle(fontSize: 32)),
          ],
        ),
      );
    }
  }
}
