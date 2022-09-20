import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid_nineteen/views/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 8),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Lottie.asset('assets/stay-safe.json',
                  width: 240, height: 320, alignment: Alignment.center)),
          AnimatedTextKit(animatedTexts: [
            WavyAnimatedText('COVID 19',
                textStyle: const TextStyle(
                    fontSize: 32,
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                ),
                child: Image.asset(
                  'assets/bacteria.png',
                  width: 45,
                  height: 45,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              const Text(
                'Tracker',
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
