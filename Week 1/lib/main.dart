import 'package:flutter/material.dart';

/// Starts the Week 1 app and displays the final workshop screen.
void main() {
  runApp(const MyApp());
}

/// Root widget that selects which workshop screen is shown.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen6(),
    );
  }
}

/// Demonstrates the simplest Flutter screen without a Scaffold.
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Screen 1: No Scaffold Widget');
  }
}

/// Demonstrates a basic screen wrapped in a Scaffold.
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Screen 2: Scaffold Widget'),
    );
  }
}

/// Demonstrates centering content inside a Scaffold.
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Screen 3: Scaffold and Center Widgets'),
      ),
    );
  }
}

/// Demonstrates using a Container to set a background color.
class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: const Center(
          child: Text('Screen 4: Teal Container'),
        ),
      ),
    );
  }
}

/// Demonstrates styled text using the Bebas Neue font.
class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: const Center(
          child: Text(
            'BINGEFLIX',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'BebasNeue',
              fontSize: 80,
            ),
          ),
        ),
      ),
    );
  }
}

/// Final Week 1 screen combining an AppBar, background color, and styled text.
class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: const Text(
          'BINGEWORTHY TV SHOWS',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'BebasNeue',
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        color: Colors.teal,
        child: const Center(
          child: Text(
            'BINGEFLIX',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'BebasNeue',
              fontSize: 80,
            ),
          ),
        ),
      ),
    );
  }
}
