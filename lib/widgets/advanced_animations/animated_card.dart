import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Advanced animated card with 3D tilt effect
class AnimatedCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool enable3D;
  final VoidCallback? onTap;

  const AnimatedCard({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.enable3D = true,
    this.onTap,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  Offset _mousePosition = Offset.zero;
  late AnimationController _controller;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _elevationAnimation = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
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
      onHover: (event) {
        setState(() {
          _mousePosition = event.localPosition;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return AnimatedBuilder(
              animation: _elevationAnimation,
              builder: (context, child) {
                // Calculate tilt based on mouse position
                double tiltX = 0;
                double tiltY = 0;

                if (widget.enable3D &&
                    _isHovered &&
                    constraints.maxHeight.isFinite) {
                  final width = constraints.maxWidth;
                  final height = constraints.maxHeight;
                  tiltX = ((_mousePosition.dy / height) - 0.5) * 0.1;
                  tiltY = ((_mousePosition.dx / width) - 0.5) * -0.1;
                }

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(tiltX)
                    ..rotateY(tiltY)
                    ..translate(0.0, _isHovered ? -8.0 : 0.0),
                  child: Container(
                    padding:
                        widget.padding ??
                        const EdgeInsets.all(AppTheme.spacingXl),
                    decoration: BoxDecoration(
                      color: widget.backgroundColor ?? AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(AppTheme.radiusXl),
                      border: Border.all(
                        color: _isHovered
                            ? AppTheme.primaryColor.withOpacity(0.5)
                            : AppTheme.borderColor,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(
                            _isHovered ? 0.3 : 0.0,
                          ),
                          blurRadius: _elevationAnimation.value,
                          offset: Offset(0, _elevationAnimation.value / 2),
                        ),
                      ],
                    ),
                    child: child,
                  ),
                );
              },
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}
