import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class SocialButton extends StatefulWidget {
  final IconData icon;
  final String? url;
  final VoidCallback? onPressed;

  const SocialButton({
    super.key,
    required this.icon,
    this.url,
    this.onPressed,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -4.0 : 0.0),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: _isHovered ? AppTheme.primaryGradient : null,
            color: _isHovered ? null : AppTheme.surfaceColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? Colors.transparent : AppTheme.borderColor,
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onPressed,
              customBorder: const CircleBorder(),
              child: Icon(
                widget.icon,
                color: AppTheme.textPrimaryColor,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
