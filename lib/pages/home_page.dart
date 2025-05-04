import 'package:flutter/material.dart';
import 'film_screen.dart'; // pastikan file ini ada dan sesuai

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilmScreen()),
          );
        },
        child: const Text("Go to Film Screen"),
      ),
    );
  }
}
