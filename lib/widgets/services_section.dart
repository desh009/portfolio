import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../models/service.dart';
import 'animated_reveal.dart';
import 'responsive_container.dart';
import 'section_title.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);

    return ResponsiveContainer(
      backgroundColor: AppTheme.surfaceColor,
      child: Column(
        children: [
          const AnimatedReveal(
            child: SectionTitle(
              title: 'Services',
              subtitle: 'What I can do for you',
            ),
          ),
          const SizedBox(height: AppTheme.spacingXxxl),
          _buildServicesGrid(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildServicesGrid(BuildContext context, bool isMobile) {
    if (isMobile) {
      return Column(
        children: PortfolioData.services.asMap().entries.map((entry) {
          final index = entry.key;
          final service = entry.value;
          return AnimatedReveal(
            delay: Duration(milliseconds: 200 + (index * 100)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacingL),
              child: ServiceCard(service: service),
            ),
          );
        }).toList(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppTheme.isDesktop(context) ? 3 : 2,
        crossAxisSpacing: AppTheme.spacingL,
        mainAxisSpacing: AppTheme.spacingL,
        childAspectRatio: 0.9,
      ),
      itemCount: PortfolioData.services.length,
      itemBuilder: (context, index) {
        return AnimatedReveal(
          delay: Duration(milliseconds: 200 + (index * 100)),
          child: ServiceCard(service: PortfolioData.services[index]),
        );
      },
    );
  }
}

class ServiceCard extends StatefulWidget {
  final Service service;

  const ServiceCard({
    super.key,
    required this.service,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -10.0 : 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.cardColor,
            borderRadius: BorderRadius.circular(AppTheme.radiusXl),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primaryColor.withOpacity(0.5)
                  : AppTheme.borderColor,
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.2),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingXl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIcon(),
                const SizedBox(height: AppTheme.spacingL),
                Text(
                  widget.service.title,
                  style: AppTheme.heading4.copyWith(fontSize: 20),
                ),
                const SizedBox(height: AppTheme.spacingM),
                Text(
                  widget.service.description,
                  style: AppTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppTheme.spacingL),
                const Spacer(),
                _buildFeatures(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        gradient: _isHovered ? AppTheme.primaryGradient : null,
        color: _isHovered ? null : AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Icon(
        widget.service.icon,
        size: 32,
        color: _isHovered ? Colors.white : AppTheme.primaryColor,
      ),
    );
  }

  Widget _buildFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.service.features.map((feature) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppTheme.spacingXs),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Expanded(
                child: Text(
                  feature,
                  style: AppTheme.bodySmall,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
