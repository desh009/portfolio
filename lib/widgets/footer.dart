import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'social_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.surfaceColor,
        border: Border(
          top: BorderSide(color: AppTheme.borderColor, width: 1),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppTheme.spacingL : AppTheme.spacingXxxl,
          vertical: AppTheme.spacingXxl,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppTheme.maxContentWidth,
            ),
            child: Column(
              children: [
                if (isMobile)
                  _buildMobileLayout()
                else
                  _buildDesktopLayout(),
                const SizedBox(height: AppTheme.spacingXl),
                const Divider(color: AppTheme.borderColor),
                const SizedBox(height: AppTheme.spacingL),
                _buildCopyright(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildAbout(),
        ),
        const SizedBox(width: AppTheme.spacingXxxl),
        Expanded(
          child: _buildQuickLinks(),
        ),
        const SizedBox(width: AppTheme.spacingXxxl),
        Expanded(
          child: _buildContact(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAbout(),
        const SizedBox(height: AppTheme.spacingXl),
        _buildQuickLinks(),
        const SizedBox(height: AppTheme.spacingXl),
        _buildContact(),
      ],
    );
  }

  Widget _buildAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
              ),
              child: const Center(
                child: Text(
                  'DB',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  PortfolioData.name,
                  style: AppTheme.heading4.copyWith(fontSize: 18),
                ),
                Text(
                  PortfolioData.role,
                  style: AppTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingL),
        Text(
          'Building beautiful, high-performance mobile applications '
          'with Flutter. Passionate about clean code and great user experiences.',
          style: AppTheme.bodyMedium,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: AppTheme.spacingL),
        Row(
          children: [
            if (PortfolioData.githubUrl != null)
              SocialButton(
                icon: Icons.code,
                onPressed: () {},
              ),
            const SizedBox(width: AppTheme.spacingM),
            if (PortfolioData.linkedinUrl != null)
              SocialButton(
                icon: Icons.work,
                onPressed: () {},
              ),
            const SizedBox(width: AppTheme.spacingM),
            SocialButton(
              icon: Icons.email,
              onPressed: () {},
            ),
            const SizedBox(width: AppTheme.spacingM),
            if (PortfolioData.twitterUrl != null)
              SocialButton(
                icon: Icons.chat,
                onPressed: () {},
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    final links = [
      {'label': 'Home', 'id': 'home'},
      {'label': 'About', 'id': 'about'},
      {'label': 'Skills', 'id': 'skills'},
      {'label': 'Projects', 'id': 'projects'},
      {'label': 'Services', 'id': 'services'},
      {'label': 'Contact', 'id': 'contact'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: AppTheme.heading4.copyWith(fontSize: 18),
        ),
        const SizedBox(height: AppTheme.spacingL),
        ...links.map((link) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  // Navigation would be handled here
                },
                child: Text(
                  link['label']!,
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: AppTheme.heading4.copyWith(fontSize: 18),
        ),
        const SizedBox(height: AppTheme.spacingL),
        _buildContactItem(Icons.email_outlined, PortfolioData.email),
        const SizedBox(height: AppTheme.spacingM),
        _buildContactItem(Icons.phone_outlined, PortfolioData.phone),
        const SizedBox(height: AppTheme.spacingM),
        _buildContactItem(Icons.location_on_outlined, PortfolioData.location),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppTheme.primaryColor,
        ),
        const SizedBox(width: AppTheme.spacingS),
        Expanded(
          child: Text(
            text,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.textSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCopyright() {
    return Text(
      '© ${DateTime.now().year} ${PortfolioData.name}. All rights reserved.',
      style: AppTheme.bodySmall.copyWith(
        color: AppTheme.textSecondaryColor.withOpacity(0.7),
      ),
      textAlign: TextAlign.center,
    );
  }
}
