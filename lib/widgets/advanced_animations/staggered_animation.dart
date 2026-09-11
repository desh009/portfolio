import 'package:flutter/material.dart';

/// Staggered animation for multiple children with delay
class StaggeredAnimation extends StatelessWidget {
  final List<Widget> children;
  final Duration initialDelay;
  final Duration staggerDelay;
  final Duration itemDuration;
  final Axis direction;

  const StaggeredAnimation({
    super.key,
    required this.children,
    this.initialDelay = Duration.zero,
    this.staggerDelay = const Duration(milliseconds: 100),
    this.itemDuration = const Duration(milliseconds: 600),
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(children.length, (index) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: itemDuration,
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(
                direction == Axis.horizontal ? (1 - value) * 50 : 0,
                direction == Axis.vertical ? (1 - value) * 30 : 0,
              ),
              child: Opacity(
                opacity: value,
                child: child,
              ),
            );
          },
          child: children[index],
        );
      }),
    );
  }
}
