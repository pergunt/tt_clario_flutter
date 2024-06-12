import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  int beginTranslateY;

  FadeAnimation({
    required this.delay,
    required this.child,
    this.beginTranslateY = 150
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
      'translateY',
      Tween(begin: beginTranslateY, end: 0.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut
    );


    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (100 * delay).round()),
      duration: movieTween.duration,
      tween: movieTween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get('opacity'),
        child: Transform.translate(
            offset: Offset(0, value.get('translateY')),
            child: child
        ),
      ),
    );
  }
}