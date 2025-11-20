import 'package:flutter/material.dart';

void main() {
  runApp(AnimationApp());
}

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // optional
      title: 'Animation Example',
      home: AnimationHomePage(),
    );
  }
}

class AnimationHomePage extends StatefulWidget {
  @override
  State<AnimationHomePage> createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage> {
  double boxSize = 100;
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Implicit Animations")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: boxSize,
              height: boxSize,
              color: Colors.blue,
              curve: Curves.easeInOut,
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: opacity,
              child: Text("Hello Flutter!", style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  boxSize = boxSize == 100 ? 200 : 100;
                  opacity = opacity == 1.0 ? 0.0 : 1.0;
                });
              },
              child: Text("Animate"),
            ),
          ],
        ),
      ),
    );
  }
}
