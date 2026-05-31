import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Screen 1: No Scaffold Widget');
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Screen 2: Scaffold Widget'),
    );
  }
}

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
