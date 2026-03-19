import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
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