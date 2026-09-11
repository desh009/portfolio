import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final IconData? icon;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isPrimary = true,
    this.icon,
    this.isOutlined = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -2.0 : 0.0),
        child: widget.isOutlined
            ? _buildOutlinedButton()
            : _buildFilledButton(),
      ),
    );
  }

  Widget _buildFilledButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: widget.isPrimary ? AppTheme.primaryGradient : null,
        color: widget.isPrimary ? null : AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingXl,
              vertical: AppTheme.spacingM,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, size: 20),
                  const SizedBox(width: AppTheme.spacingS),
                ],
                Text(
                  widget.text,
                  style: AppTheme.button,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _isHovered ? AppTheme.primaryColor : AppTheme.borderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(AppTheme.radiusM),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingXl,
              vertical: AppTheme.spacingM,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    size: 20,
                    color: _isHovered
                        ? AppTheme.primaryColor
                        : AppTheme.textPrimaryColor,
                  ),
                  const SizedBox(width: AppTheme.spacingS),
                ],
                Text(
                  widget.text,
                  style: AppTheme.button.copyWith(
                    color: _isHovered
                        ? AppTheme.primaryColor
                        : AppTheme.textPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
