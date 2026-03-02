import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.currentIndex,
    this.totalDots = 3,
  });

  final int currentIndex;
  final int totalDots;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: totalDots,
      position: currentIndex.toDouble(),

      decorator: DotsDecorator(
        color: Color(0xffA0A1A5),
        activeColor: Color(0xff54afa5),
      ),
    );
  }
}
