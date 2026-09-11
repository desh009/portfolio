import 'package:flutter/material.dart';

/// Animated text that reveals with fade and slide effect
class AnimatedTextReveal extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration delay;
  final Duration duration;
  final TextAlign? textAlign;

  const AnimatedTextReveal({
    super.key,
    required this.text,
    this.style,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 800),
    this.textAlign,
  });

  @override
  State<AnimatedTextReveal> createState() => _AnimatedTextRevealState();
}

class _AnimatedTextRevealState extends State<AnimatedTextReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 30),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    // Start animation after delay
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _slideAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: child,
          ),
        );
      },
      child: Text(
        widget.text,
        style: widget.style,
        textAlign: widget.textAlign,
      ),
    );
  }
}

/// Animated text with character-by-character reveal (typewriter effect)
class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration delay;
  final Duration speed;
  final TextAlign? textAlign;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.delay = Duration.zero,
    this.speed = const Duration(milliseconds: 50),
    this.textAlign,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayedText = '';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      _startTyping();
    });
  }

  void _startTyping() {
    if (!mounted) return;

    if (_currentIndex < widget.text.length) {
      setState(() {
        _displayedText = widget.text.substring(0, _currentIndex + 1);
        _currentIndex++;
      });
      Future.delayed(widget.speed, _startTyping);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.style,
      textAlign: widget.textAlign,
    );
  }
}

/// Gradient animated text with shimmer
class GradientAnimatedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign? textAlign;

  const GradientAnimatedText({
    super.key,
    required this.text,
    this.style,
    required this.gradient,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Text(
        text,
        style: style?.copyWith(color: Colors.white),
        textAlign: textAlign,
      ),
    );
  }
}
