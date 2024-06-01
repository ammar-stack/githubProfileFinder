import 'dart:async';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splashBack.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: FadeIn(
              duration: Duration(milliseconds: 500),
              child: Image(
                  image: AssetImage('assets/splashLogo.png'),
                  height: 130,
                  width: 130),
            ),
          )),
    );
  }
}
