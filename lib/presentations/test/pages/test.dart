import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/configs/assets/app_lottie.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
  // * controller
  late AnimationController _animationCon;

  // Tween
  late Animation<AlignmentGeometry> align;

  @override
  void dispose() {
    _animationCon.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationCon = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      reverseDuration: const Duration(seconds: 3),
    );

    align =
        Tween<AlignmentGeometry>(
          begin: Alignment.topCenter,
          end: Alignment.topRight,
        ).animate(
          CurvedAnimation(
            parent: _animationCon,
            curve: Curves.easeInOut,
            reverseCurve: Curves.easeInOut,
          ),
        );

    _animationCon.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _cloudy(),
            ElevatedButton(
              onPressed: () => _animationCon.forward(),
              child: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cloudy() {
    //PositionedTransition(rect: rect, child: child)
    return Expanded(
      child: Stack(
        children: [
          AlignTransition(
            alignment: align,
            child: Lottie.asset(AppLottie.snowMoon, width: 30),
          ),
        ],
      ),
    );
  }
}
