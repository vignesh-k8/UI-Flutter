import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// State Class
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Notify UI about state change
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: ProviderApp(),
    ),
  );
}

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      home: Scaffold(
        appBar: AppBar(title: Text('State Management with Provider')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<Counter>(
                builder: (context, counter, child) => Text(
                  'Counter: ${counter.count}',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Provider.of<Counter>(context, listen: false).increment();
                },
                child: Text("Increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
