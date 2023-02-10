
import 'package:flutter/material.dart';
import 'package:planet/screens/Homepage.dart';
import 'package:planet/screens/details.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'details': (context) => const DetailPage(),
      },
    ),
  );
}
