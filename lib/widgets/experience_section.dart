import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../models/experience.dart';
import 'animated_reveal.dart';
import 'responsive_container.dart';
import 'section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Column(
        children: [
          const AnimatedReveal(
            child: SectionTitle(
              title: 'Experience & Education',
              subtitle: 'My professional journey',
            ),
          ),
          const SizedBox(height: AppTheme.spacingXxxl),
          ...PortfolioData.experiences.asMap().entries.map((entry) {
            final index = entry.key;
            final experience = entry.value;
            return AnimatedReveal(
              delay: Duration(milliseconds: 200 + (index * 200)),
              child: TimelineItem(
                experience: experience,
                isLast: index == PortfolioData.experiences.length - 1,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class TimelineItem extends StatefulWidget {
  final Experience experience;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.experience,
    required this.isLast,
  });

  @override
  State<TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<TimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Timeline indicator
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: _isHovered || widget.experience.isEducation
                        ? AppTheme.primaryGradient
                        : null,
                    color: _isHovered || widget.experience.isEducation
                        ? null
                        : AppTheme.borderColor,
                    border: Border.all(
                      color: AppTheme.primaryColor,
                      width: 3,
                    ),
                    boxShadow: _isHovered
                        ? [
                            BoxShadow(
                              color: AppTheme.primaryColor.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(
                        vertical: AppTheme.spacingS,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.primaryColor.withOpacity(0.5),
                            AppTheme.borderColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: AppTheme.spacingL),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppTheme.spacingXxl),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.identity()
                    ..translate(_isHovered ? 8.0 : 0.0, 0.0),
                  decoration: BoxDecoration(
                    color: AppTheme.cardColor,
                    borderRadius: BorderRadius.circular(AppTheme.radiusL),
                    border: Border.all(
                      color: _isHovered
                          ? AppTheme.primaryColor.withOpacity(0.5)
                          : AppTheme.borderColor,
                    ),
                    boxShadow: _isHovered
                        ? [
                            BoxShadow(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ]
                        : null,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      isMobile ? AppTheme.spacingL : AppTheme.spacingXl,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        if (widget.experience.responsibilities.isNotEmpty) ...[
                          const SizedBox(height: AppTheme.spacingL),
                          _buildResponsibilities(),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingM,
                vertical: AppTheme.spacingXs,
              ),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(AppTheme.radiusS),
              ),
              child: Text(
                widget.experience.period,
                style: AppTheme.bodySmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            if (widget.experience.isEducation)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingM,
                  vertical: AppTheme.spacingXs,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(AppTheme.radiusS),
                  border: Border.all(color: AppTheme.borderColor),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.school,
                      size: 14,
                      color: AppTheme.primaryColor,
                    ),
                    const SizedBox(width: AppTheme.spacingXs),
                    Text(
                      'Education',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingM),
        Text(
          widget.experience.title,
          style: AppTheme.heading4.copyWith(fontSize: 20),
        ),
        const SizedBox(height: AppTheme.spacingS),
        Row(
          children: [
            Icon(
              widget.experience.isEducation ? Icons.school : Icons.business,
              size: 18,
              color: AppTheme.textSecondaryColor,
            ),
            const SizedBox(width: AppTheme.spacingS),
            Expanded(
              child: Text(
                widget.experience.company,
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.textSecondaryColor,
                ),
              ),
            ),
          ],
        ),
        if (widget.experience.location != null) ...[
          const SizedBox(height: AppTheme.spacingXs),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 18,
                color: AppTheme.textSecondaryColor,
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                widget.experience.location!,
                style: AppTheme.bodySmall,
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildResponsibilities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Responsibilities:',
          style: AppTheme.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: AppTheme.spacingM),
        ...widget.experience.responsibilities.map((responsibility) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingS),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(
                    Icons.arrow_right,
                    size: 20,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(
                  child: Text(
                    responsibility,
                    style: AppTheme.bodyMedium,
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
