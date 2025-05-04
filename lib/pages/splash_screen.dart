import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../main_screen.dart'; // ganti sesuai halaman utama kamu

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset(
          '../assets/lottie/netflix.json',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
