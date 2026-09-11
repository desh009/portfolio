import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'advanced_animations/floating_animation.dart';
import 'advanced_animations/pulse_animation.dart';

class AnimatedProfilePicture extends StatelessWidget {
  final double size;
  final bool enableAnimation;

  const AnimatedProfilePicture({
    super.key,
    this.size = 200,
    this.enableAnimation = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget profileWidget = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppTheme.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.4),
            blurRadius: 30,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.cardColor,
            border: Border.all(color: AppTheme.borderColor, width: 2),
          ),
          child: ClipOval(
            child: PortfolioData.profileImagePath != null
                ? Image.asset(
                    PortfolioData.profileImagePath!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildPlaceholder();
                    },
                  )
                : _buildPlaceholder(),
          ),
        ),
      ),
    );

    if (enableAnimation) {
      profileWidget = FloatingAnimation(
        duration: const Duration(seconds: 3),
        distance: 10,
        child: PulseAnimation(
          duration: const Duration(milliseconds: 2000),
          minScale: 0.98,
          maxScale: 1.02,
          child: profileWidget,
        ),
      );
    }

    return profileWidget;
  }

  Widget _buildPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor.withOpacity(0.3),
            AppTheme.secondaryColor.withOpacity(0.3),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: size * 0.4, color: AppTheme.primaryColor),
            SizedBox(height: size * 0.05),
            Text(
              'DB',
              style: TextStyle(
                fontSize: size * 0.2,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
