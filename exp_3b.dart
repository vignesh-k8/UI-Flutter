import 'package:flutter/material.dart';

void main() {
  runApp(BreakpointApp());
}

class BreakpointApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediaQuery & Breakpoints',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Responsive with Breakpoints'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile Layout
              return Container(
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Text(
                    'Mobile View',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1200) {
              // Tablet Layout
              return Container(
                color: Colors.teal,
                child: Center(
                  child: Text(
                    'Tablet View',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              );
            } else {
              // Desktop Layout
              return Container(
                color: Colors.deepPurple,
                child: Center(
                  child: Text(
                    'Desktop View',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
