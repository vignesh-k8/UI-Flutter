import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless vs Stateful',
      home: Scaffold(
        appBar: AppBar(title: Text('Stateless & Stateful Widgets')),
        body: Center(   
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Text(
                'I am a Stateless Widget!',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center, 
              ),
              SizedBox(height: 20),
              CounterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}







class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;
  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        Text(
          "Counter Value: $counter",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: increment,
          child: Text("Increment"),
        ),
      ],
    );
  }
}
