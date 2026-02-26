import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color.fromARGB(200, 0, 80, 80)),
          child: const Center(
            child: Text('Bingeflix')
          )
        ),
      ),
    ),
  );
}
