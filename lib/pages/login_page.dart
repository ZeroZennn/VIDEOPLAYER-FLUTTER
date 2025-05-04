import 'package:flutter/material.dart';
import 'home_page.dart';
import '../main_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        },
        child: const Text("Go to Home Page"),
      ),
    );
  }
}
