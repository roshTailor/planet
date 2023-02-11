
import 'package:flutter/material.dart';
import 'package:planet/screens/Homepage.dart';
import 'package:planet/screens/details.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF010D41),
        )
      ),
      routes: {
        '/': (context) => const HomePage(),
        'details': (context) => const DetailPage(),
      },
    ),
  );
}
