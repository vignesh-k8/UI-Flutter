import 'package:flutter/material.dart';

void main() {
  runApp(CustomWidgetApp());
}

class CustomWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widgets Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Widgets')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(label: "Click Me", color: Colors.blue),
              SizedBox(height: 20),
              CustomCard(
                title: "Flutter Card",
                description: "This is a reusable custom card widget.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String label;
  final Color color;

  CustomButton({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: () {},
      child: Text(label, style: TextStyle(fontSize: 18)),
    );
  }
}

// Custom Card Widget
class CustomCard extends StatelessWidget {
  final String title;
  final String description;

  CustomCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
