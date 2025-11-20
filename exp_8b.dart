import 'package:flutter/material.dart';

void main() {
  runApp(AnimationTypesApp());
}

class AnimationTypesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Different Animations',
      home: AnimationTypesPage(),
    );
  }
}

class AnimationTypesPage extends StatefulWidget {
  @override
  _AnimationTypesPageState createState() => _AnimationTypesPageState();
}

class _AnimationTypesPageState extends State<AnimationTypesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }




  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fade & Slide Animation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text("Fade In-Out Text", style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                width: 150,
                height: 100,
                color: Colors.orange,
                child: Center(
                    child: Text("Sliding Box",
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _startAnimation,
              child: Text("Start Animation"),
            ),
          ],
        ),
      ),
    );
  }
}
