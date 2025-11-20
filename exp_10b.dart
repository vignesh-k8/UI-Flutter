import 'package:flutter/material.dart';

void main() => runApp(MyDebugApp());

class MyDebugApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debugging Example',
      home: Scaffold(
        appBar: AppBar(title: Text("Debugging Example")),
        body: Center(
          child: BuggyWidget(),
        ),
      ),
    );
  }
}

class BuggyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Intentional bug: Null value
    String? name;
    debugPrint("Debugging BuggyWidget, name = $name");

    return Text(
      name ?? "Default Name", // Fix: Use null check
      style: TextStyle(fontSize: 24),
    );
  }
}
