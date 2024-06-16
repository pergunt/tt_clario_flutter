import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation({
    super.key,
    required this.delay,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final movieTween = MovieTween();

    movieTween.tween(
      'opacity',
      Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn
    )
    .thenTween(
      'scale',
      Tween(begin: 1.0, end: 1.2),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut
    )
    .thenTween(
      'scale',
      Tween(begin: 1.2, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut
    );

    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (100 * delay).round()),
      duration: const Duration(milliseconds: 1000),
      tween: movieTween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get('opacity'),
        child: Transform.scale(
          scale: value.get('scale'),
          child: child,
        ),
      ),
    );
  }
}