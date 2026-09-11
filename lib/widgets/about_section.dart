import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'animated_reveal.dart';
import 'responsive_container.dart';
import 'section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);
    final bool isTablet = AppTheme.isTablet(context);

    return ResponsiveContainer(
      backgroundColor: AppTheme.surfaceColor,
      child: Column(
        children: [
          const AnimatedReveal(
            child: SectionTitle(
              title: 'About Me',
              subtitle: 'Get to know me better',
            ),
          ),
          const SizedBox(height: AppTheme.spacingXxxl),
          if (isMobile || isTablet)
            _buildMobileLayout()
          else
            _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: AnimatedReveal(
            delay: const Duration(milliseconds: 200),
            slideOffset: const Offset(-50, 0),
            child: _buildProfileImage(),
          ),
        ),
        const SizedBox(width: AppTheme.spacingXxxl),
        Expanded(
          flex: 2,
          child: AnimatedReveal(
            delay: const Duration(milliseconds: 400),
            slideOffset: const Offset(50, 0),
            child: _buildAboutContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        AnimatedReveal(
          delay: const Duration(milliseconds: 200),
          child: _buildProfileImage(),
        ),
        const SizedBox(height: AppTheme.spacingXxl),
        AnimatedReveal(
          delay: const Duration(milliseconds: 400),
          child: _buildAboutContent(),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusXl),
        gradient: AppTheme.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusXl),
            color: AppTheme.cardColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusXl),
            child: AspectRatio(
              aspectRatio: 1,
              child: PortfolioData.profileImagePath != null
                  ? Image.asset(
                      PortfolioData.profileImagePath!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholderImage();
                      },
                    )
                  : _buildPlaceholderImage(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: AppTheme.surfaceColor,
      child: const Icon(Icons.person, size: 120, color: AppTheme.primaryColor),
    );
  }

  Widget _buildAboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Professional Profile',
          style: AppTheme.heading4.copyWith(color: AppTheme.primaryColor),
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(PortfolioData.aboutMeDetailed, style: AppTheme.bodyLarge),
        const SizedBox(height: AppTheme.spacingXl),
        _buildInfoGrid(),
        const SizedBox(height: AppTheme.spacingXl),
        _buildCertifications(),
      ],
    );
  }

  Widget _buildInfoGrid() {
    return Wrap(
      spacing: AppTheme.spacingXl,
      runSpacing: AppTheme.spacingL,
      children: [
        _buildInfoItem(
          icon: Icons.email_outlined,
          label: 'Email',
          value: PortfolioData.email,
        ),
        _buildInfoItem(
          icon: Icons.phone_outlined,
          label: 'Phone',
          value: PortfolioData.phone,
        ),
        _buildInfoItem(
          icon: Icons.location_on_outlined,
          label: 'Location',
          value: PortfolioData.location,
        ),
        _buildInfoItem(
          icon: Icons.work_outline,
          label: 'Experience',
          value: '2+ Years',
        ),
      ],
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: AppTheme.spacingM),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTheme.bodySmall.copyWith(
                color: AppTheme.textSecondaryColor.withOpacity(0.7),
              ),
            ),
            Text(
              value,
              style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCertifications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Certifications', style: AppTheme.heading4.copyWith(fontSize: 20)),
        const SizedBox(height: AppTheme.spacingL),
        ...PortfolioData.certifications.map((cert) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingM),
            child: Row(
              children: [
                const Icon(
                  Icons.verified,
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cert['title']!,
                        style: AppTheme.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${cert['issuer']} • ${cert['year']}',
                        style: AppTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
