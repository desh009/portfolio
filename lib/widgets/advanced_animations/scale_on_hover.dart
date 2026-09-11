import 'package:flutter/material.dart';

/// Advanced hover effect with scale and glow
class ScaleOnHover extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;
  final bool enableGlow;
  final Color? glowColor;

  const ScaleOnHover({
    super.key,
    required this.child,
    this.scale = 1.05,
    this.duration = const Duration(milliseconds: 200),
    this.enableGlow = false,
    this.glowColor,
  });

  @override
  State<ScaleOnHover> createState() => _ScaleOnHoverState();
}

class _ScaleOnHoverState extends State<ScaleOnHover>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scale,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: widget.enableGlow && _isHovered
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: (widget.glowColor ?? Colors.blue)
                              .withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    )
                  : null,
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
