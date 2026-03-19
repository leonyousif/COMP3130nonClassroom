import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 0, 150, 136),
          child: const Center(
            child: Text(
              'BINGEFLIX',
              style: TextStyle(
                fontSize: 80,
                color: Colors.black,
                fontFamily: 'BebasNeue',
              ),
            ),
          ),
        ),
      ),
    ),
  );
}