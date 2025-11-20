import 'package:flutter/material.dart';

void main() {
  runApp(ThemeApp());
}

class ThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theming Example',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey.shade800),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
      home: ThemeHomePage(),
    );
  }
}

class ThemeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theming Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Themed App",
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 20),
            Text("This text uses custom body style",
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Styled Button"),
            ),
          ],
        ),
      ),
    );
  }
}
