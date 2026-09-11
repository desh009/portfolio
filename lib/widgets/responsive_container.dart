import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);
    
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: padding ?? EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.spacingL : AppTheme.spacingXxxl,
        vertical: isMobile ? AppTheme.spacingXl : AppTheme.spacingXxxl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppTheme.maxContentWidth,
          ),
          child: child,
        ),
      ),
    );
  }
}
