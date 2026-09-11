import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../models/project.dart';
import 'animated_reveal.dart';
import 'responsive_container.dart';
import 'section_title.dart';
import 'advanced_animations/scale_on_hover.dart';
import 'project_image_display.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);

    return ResponsiveContainer(
      backgroundColor: AppTheme.surfaceColor,
      child: Column(
        children: [
          const AnimatedReveal(
            child: SectionTitle(
              title: 'Featured Projects',
              subtitle: 'Some of my recent work and accomplishments',
            ),
          ),
          const SizedBox(height: AppTheme.spacingXxxl),
          if (isMobile) _buildMobileLayout() else _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      children: PortfolioData.projects.asMap().entries.map((entry) {
        final index = entry.key;
        final project = entry.value;
        return AnimatedReveal(
          delay: Duration(milliseconds: 200 + (index * 200)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingXxl),
            child: ProjectCard(project: project, index: index),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: PortfolioData.projects.asMap().entries.map((entry) {
        final index = entry.key;
        final project = entry.value;
        return AnimatedReveal(
          delay: Duration(milliseconds: 200 + (index * 200)),
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.spacingXl),
            child: ProjectCard(project: project, index: index),
          ),
        );
      }).toList(),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;
  final int index;

  const ProjectCard({super.key, required this.project, required this.index});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);
    final bool isEven = widget.index % 2 == 0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusXl),
            child: isMobile
                ? _buildMobileContent()
                : _buildDesktopContent(isEven),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopContent(bool isEven) {
    return IntrinsicHeight(
      child: Row(
        children: [
          if (isEven) ...[
            Expanded(flex: 2, child: _buildProjectImage()),
            Expanded(flex: 3, child: _buildProjectDetails()),
          ] else ...[
            Expanded(flex: 3, child: _buildProjectDetails()),
            Expanded(flex: 2, child: _buildProjectImage()),
          ],
        ],
      ),
    );
  }

  Widget _buildMobileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildProjectImage(), _buildProjectDetails()],
    );
  }

  Widget _buildProjectImage() {
    return widget.project.screenshots != null &&
            widget.project.screenshots!.isNotEmpty
        ? ProjectScreenshotGallery(
            screenshots: widget.project.screenshots!,
            height: 300,
          )
        : ProjectImageDisplay(
            imagePath: widget.project.imageUrl,
            height: 300,
            projectTitle: widget.project.title,
          );
  }

  Widget _buildProjectDetails() {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingXl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.project.title, style: AppTheme.heading4),
          const SizedBox(height: AppTheme.spacingM),
          Text(widget.project.description, style: AppTheme.bodyMedium),
          const SizedBox(height: AppTheme.spacingL),
          _buildTechnologies(),
          const SizedBox(height: AppTheme.spacingL),
          _buildFeatures(),
          if (widget.project.githubUrl != null ||
              widget.project.liveUrl != null) ...[
            const SizedBox(height: AppTheme.spacingL),
            _buildProjectLinks(),
          ],
        ],
      ),
    );
  }

  Widget _buildTechnologies() {
    return Wrap(
      spacing: AppTheme.spacingS,
      runSpacing: AppTheme.spacingS,
      children: widget.project.technologies.map((tech) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingS,
          ),
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(AppTheme.radiusS),
          ),
          child: Text(
            tech,
            style: AppTheme.bodySmall.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFeatures() {
    if (widget.project.features.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features:',
          style: AppTheme.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        ...widget.project.features.take(3).map((feature) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: AppTheme.spacingXs,
              left: AppTheme.spacingS,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(
                    Icons.check_circle,
                    size: 16,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingS),
                Expanded(child: Text(feature, style: AppTheme.bodySmall)),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildProjectLinks() {
    return Row(
      children: [
        if (widget.project.githubUrl != null)
          _buildLinkButton(icon: Icons.code, label: 'Code', onPressed: () {}),
        if (widget.project.githubUrl != null && widget.project.liveUrl != null)
          const SizedBox(width: AppTheme.spacingM),
        if (widget.project.liveUrl != null)
          _buildLinkButton(
            icon: Icons.open_in_new,
            label: 'Live Demo',
            onPressed: () {},
          ),
      ],
    );
  }

  Widget _buildLinkButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: AppTheme.primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
      ),
    );
  }
}
