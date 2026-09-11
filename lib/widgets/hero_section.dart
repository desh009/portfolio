import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'animated_reveal.dart';
import 'custom_button.dart';
import 'social_button.dart';
import 'advanced_animations/floating_animation.dart';
import 'advanced_animations/shimmer_effect.dart';
import 'animated_profile_picture.dart';
import 'advanced_animations/animated_text_reveal.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onProjectsPressed;

  const HeroSection({
    super.key,
    required this.onContactPressed,
    required this.onProjectsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
      child: Stack(
        children: [
          // Animated background elements
          _buildBackgroundElements(),

          // Content with scroll support
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? AppTheme.spacingL
                      : AppTheme.spacingXxxl,
                  vertical: AppTheme.spacingXxl,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: AppTheme.maxContentWidth,
                    minHeight: screenHeight - (AppTheme.spacingXxl * 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Profile Picture
                      AnimatedReveal(
                        delay: const Duration(milliseconds: 100),
                        child: AnimatedProfilePicture(
                          size: isMobile ? 120 : 180,
                          enableAnimation: true,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingL),
                      AnimatedReveal(
                        delay: const Duration(milliseconds: 200),
                        child: AnimatedTextReveal(
                          text: 'Hi, I\'m',
                          style: AppTheme.bodyLarge.copyWith(
                            color: AppTheme.primaryColor,
                          ),
                          delay: const Duration(milliseconds: 300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingM),
                      AnimatedReveal(
                        delay: const Duration(milliseconds: 400),
                        child: ShimmerEffect(
                          duration: const Duration(milliseconds: 2000),
                          child: GradientAnimatedText(
                            text: PortfolioData.name,
                            style: isMobile
                                ? AppTheme.heading2
                                : AppTheme.heading1,
                            gradient: AppTheme.primaryGradient,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingM),
                      AnimatedReveal(
                        delay: const Duration(milliseconds: 600),
                        child: TypewriterText(
                          text: PortfolioData.role,
                          style: isMobile
                              ? AppTheme.heading4
                              : AppTheme.heading3,
                          delay: const Duration(milliseconds: 1000),
                          speed: const Duration(milliseconds: 80),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingL),
                      AnimatedReveal(
                        delay: const Duration(milliseconds: 800),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: AnimatedTextReveal(
                            text: PortfolioData.aboutMe,
                            style: AppTheme.bodyLarge,
                            delay: const Duration(milliseconds: 1500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingXl),
                      AnimatedReveal(
                        delay: const Duration(milliseconds: 1000),
                        child: Wrap(
                          spacing: AppTheme.spacingM,
                          runSpacing: AppTheme.spacingM,
                          alignment: WrapAlignment.center,
                          children: [
                            CustomButton(
                              text: 'Get In Touch',
                              onPressed: onContactPressed,
                              icon: Icons.mail_outline,
                            ),
                            CustomButton(
                              text: 'View Projects',
                              onPressed: onProjectsPressed,
                              isOutlined: true,
                              icon: Icons.work_outline,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingL),
                      AnimatedReveal(
                        delay: const Duration(milliseconds: 1200),
                        child: _buildSocialLinks(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Scroll indicator
          Positioned(
            bottom: AppTheme.spacingXxl,
            left: 0,
            right: 0,
            child: AnimatedReveal(
              delay: const Duration(milliseconds: 1400),
              child: _buildScrollIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundElements() {
    return Stack(
      children: [
        // Animated circle 1
        Positioned(
          top: 100,
          right: -100,
          child: FloatingAnimation(
            duration: const Duration(seconds: 4),
            distance: 20,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryColor.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
        // Animated circle 2
        Positioned(
          bottom: 100,
          left: -100,
          child: FloatingAnimation(
            duration: const Duration(seconds: 5),
            distance: 15,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.secondaryColor.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
        // Additional floating element
        Positioned(
          top: 200,
          left: 100,
          child: FloatingAnimation(
            duration: const Duration(seconds: 6),
            distance: 10,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.accentColor.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (PortfolioData.githubUrl != null)
          SocialButton(icon: Icons.code, onPressed: () {}),
        const SizedBox(width: AppTheme.spacingM),
        if (PortfolioData.linkedinUrl != null)
          SocialButton(icon: Icons.work, onPressed: () {}),
        const SizedBox(width: AppTheme.spacingM),
        SocialButton(icon: Icons.email, onPressed: () {}),
        const SizedBox(width: AppTheme.spacingM),
        if (PortfolioData.twitterUrl != null)
          SocialButton(icon: Icons.chat, onPressed: () {}),
      ],
    );
  }

  Widget _buildScrollIndicator() {
    return Column(
      children: [
        Text(
          'Scroll Down',
          style: AppTheme.bodySmall.copyWith(
            color: AppTheme.textSecondaryColor.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 10),
          duration: const Duration(milliseconds: 1000),
          builder: (context, double value, child) {
            return Transform.translate(offset: Offset(0, value), child: child);
          },
          child: Icon(
            Icons.keyboard_arrow_down,
            color: AppTheme.textSecondaryColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
