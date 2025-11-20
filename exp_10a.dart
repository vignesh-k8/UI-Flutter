import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// DATA_MODEL
/// The data model for the counter application.
/// It extends ChangeNotifier to notify listeners about changes in its state.
class CounterData extends ChangeNotifier {
  int _count;

  /// Initializes the counter with a default value of 0.
  CounterData() : _count = 0;

  /// Getter to access the current count value.
  int get count => _count;

  /// Increments the counter value by 1 and notifies listeners.
  void increment() {
    _count++;
    notifyListeners();
  }

  /// Decrements the counter value by 1 and notifies listeners.
  void decrement() {
    _count--;
    notifyListeners();
  }
}

void main() {
  runApp(const CounterApp());
}

/// The root widget of the application.
/// It provides the CounterData to its descendants using ChangeNotifierProvider.
class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<CounterData>(
        create: (BuildContext context) => CounterData(),
        builder: (BuildContext context, Widget? child) {
          // The CounterHomePage will have access to CounterData from this context.
          return const CounterHomePage();
        },
      ),
    );
  }
}

/// The home page of the counter application.
/// It displays the current count and provides buttons to increment and decrement it.
class CounterHomePage extends StatelessWidget {
  const CounterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the CounterData instance using Provider.of.
    // listen: true by default, so the widget will rebuild when notifyListeners is called.
    final CounterData counter = Provider.of<CounterData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Counter App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current count:',
              style: TextStyle(fontSize: 24),
            ),
            // Display the current count from the data model.
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 48), // Spacing for better visual separation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Button to decrement the count
                ElevatedButton.icon(
                  onPressed: () => counter.decrement(),
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrement'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                // Button to increment the count
                ElevatedButton.icon(
                  onPressed: () => counter.increment(),
                  icon: const Icon(Icons.add),
                  label: const Text('Increment'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
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
