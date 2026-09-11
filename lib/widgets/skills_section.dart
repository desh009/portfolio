import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../models/skill.dart';
import 'animated_reveal.dart';
import 'responsive_container.dart';
import 'section_title.dart';
import 'advanced_animations/animated_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = PortfolioData.skillCategories;

    return ResponsiveContainer(
      child: Column(
        children: [
          const AnimatedReveal(
            child: SectionTitle(
              title: 'Skills & Technologies',
              subtitle: 'My technical expertise and proficiency',
            ),
          ),
          const SizedBox(height: AppTheme.spacingXxxl),
          ...categories.asMap().entries.map((entry) {
            final index = entry.key;
            final category = entry.value;
            final skills = PortfolioData.getSkillsByCategory(category);

            return AnimatedReveal(
              delay: Duration(milliseconds: 200 + (index * 100)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppTheme.spacingXxl),
                child: _buildSkillCategory(context, category, skills),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String category,
    List<Skill> skills,
  ) {
    final bool isMobile = AppTheme.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(AppTheme.radiusS),
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            Text(category, style: AppTheme.heading4.copyWith(fontSize: 20)),
          ],
        ),
        const SizedBox(height: AppTheme.spacingL),
        if (isMobile)
          _buildMobileSkillsLayout(skills)
        else
          _buildDesktopSkillsLayout(skills),
      ],
    );
  }

  Widget _buildDesktopSkillsLayout(List<Skill> skills) {
    return Wrap(
      spacing: AppTheme.spacingL,
      runSpacing: AppTheme.spacingL,
      children: skills.map((skill) => _buildSkillCard(skill)).toList(),
    );
  }

  Widget _buildMobileSkillsLayout(List<Skill> skills) {
    return Column(
      children: skills.map((skill) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppTheme.spacingL),
          child: _buildSkillCard(skill, fullWidth: true),
        );
      }).toList(),
    );
  }

  Widget _buildSkillCard(Skill skill, {bool fullWidth = false}) {
    return AnimatedCard(
      enable3D: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  skill.name,
                  style: AppTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
              ),
              TweenAnimationBuilder<int>(
                tween: IntTween(
                  begin: 0,
                  end: (skill.proficiency * 100).toInt(),
                ),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Text(
                    '$value%',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          _buildProgressBar(skill.proficiency),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double proficiency) {
    return Stack(
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
          ),
        ),
        FractionallySizedBox(
          widthFactor: proficiency,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: proficiency),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return FractionallySizedBox(
                widthFactor: value / proficiency,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(AppTheme.radiusS),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
