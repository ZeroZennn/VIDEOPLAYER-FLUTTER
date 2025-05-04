import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html; // hanya untuk web
import 'welcome_page.dart'; // halaman berikutnya

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // Delay sedikit agar Web tidak salah deteksi (download)
    Future.delayed(const Duration(milliseconds: 300), () {
      _playIntroSound();
    });

    // Navigasi ke halaman utama setelah 4 detik
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });
  }

  Future<void> _playIntroSound() async {
    if (kIsWeb) {
      // Audio untuk web harus ditambahkan ke DOM
      final audio =
          html.AudioElement()
            ..src = 'assets/audios/netflix_intro.mp3'
            ..autoplay = true
            ..style.display = 'none'; // agar tidak terlihat
      html.document.body!.append(audio);
    } else {
      await _audioPlayer.play(AssetSource('audios/netflix_intro.mp3'));
    }
  }

  @override
  void dispose() {
    if (!kIsWeb) {
      _audioPlayer.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset(
          '../assets/lottie/netflix.json', // path diperbaiki
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
