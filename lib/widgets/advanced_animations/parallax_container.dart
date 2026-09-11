import 'package:flutter/material.dart';

/// Parallax scrolling effect container
class ParallaxContainer extends StatefulWidget {
  final Widget child;
  final double parallaxFactor;
  final ScrollController? scrollController;

  const ParallaxContainer({
    super.key,
    required this.child,
    this.parallaxFactor = 0.3,
    this.scrollController,
  });

  @override
  State<ParallaxContainer> createState() => _ParallaxContainerState();
}

class _ParallaxContainerState extends State<ParallaxContainer> {
  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_updateOffset);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_updateOffset);
    super.dispose();
  }

  void _updateOffset() {
    if (mounted) {
      setState(() {
        _offset = widget.scrollController?.offset ?? 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, _offset * widget.parallaxFactor),
      child: widget.child,
    );
  }
}
