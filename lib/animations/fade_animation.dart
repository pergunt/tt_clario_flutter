import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final Offset Function(double value) getOffset;

  FadeAnimation({
    super.key,
    required this.delay,
    required this.child,
    required this.getOffset
  });

  @override
  Widget build(BuildContext context) {
    final movieTween = MovieTween();

    movieTween
      .tween(
        'opacity',
        Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      )
      .thenTween(
        'move',
        Tween(begin: 120.0, end: 0.0),
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      )
      .thenTween(
        'scale',
        Tween(begin: 0.3, end: 1.1),
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      )
      .thenTween(
        'scale',
        Tween(begin: 1.1, end: 1.0),
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
    );

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (100 * delay).round()),
      duration: movieTween.duration,
      tween: movieTween,
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value.get('opacity'),
          child: Transform.translate(
            offset: getOffset(value.get('move')),
            child: Transform.scale(
              scale: value.get('scale'),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
