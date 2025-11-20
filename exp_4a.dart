import 'package:flutter/material.dart';

void main() {
  runApp(NavigationApp());
}

class NavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      home: FirstScreen(),
    );
  }
}

// First Screen
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Second Screen"),
          onPressed: () {
            // Navigate to second screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}



// Second Screen
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: ElevatedButton(
          child: Text("Back to First Screen"),
          onPressed: () {
            // Go back to first screen
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
