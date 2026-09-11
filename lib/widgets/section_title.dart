import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign textAlign;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);
    
    return Column(
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: isMobile
              ? AppTheme.heading3
              : AppTheme.heading2,
          textAlign: textAlign,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppTheme.spacingM),
          Text(
            subtitle!,
            style: AppTheme.bodyLarge,
            textAlign: textAlign,
          ),
        ],
        const SizedBox(height: AppTheme.spacingXl),
        Center(
          child: Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
            ),
          ),
        ),
      ],
    );
  }
}
