import 'package:flutter/material.dart';
import 'package:your_eyes/onboarding/on_boarding_screen.dart';
import 'package:your_eyes/shared/conestant.dart';
import 'package:your_eyes/shared/styles/colors.dart';
import 'package:your_eyes/shared/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: onBoardingScreen(),
    );
  }
}
