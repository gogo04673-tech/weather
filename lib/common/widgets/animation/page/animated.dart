import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/configs/assets/app_lottie.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationCon;

  late Animation<AlignmentGeometry> _align;

  @override
  void dispose() {
    super.dispose();

    _animationCon.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationCon = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
      reverseDuration: const Duration(seconds: 6),
    );

    _align =
        Tween<AlignmentGeometry>(
          begin: Alignment.topCenter,
          end: Alignment.topRight,
        ).animate(
          CurvedAnimation(
            parent: _animationCon,
            curve: Curves.easeIn,
            reverseCurve: Curves.easeIn,
          ),
        );

    _animationCon.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AlignTransition(
          alignment: _align,
          child: Lottie.asset(AppLottie.windy, width: 50),
        ),
      ],
    );
  }
}
