import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glass BottomNav Demo',
      theme: ThemeData.dark(), // cocok untuk efek glassmorphism
      home: const SplashScreen(), // 👉 Start from SplashScreen
    );
  }
}
