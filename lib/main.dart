import 'package:flutter/material.dart';
import 'intro_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(useMaterial3: true),
    home: const IntroScreen(),
  ));
}
