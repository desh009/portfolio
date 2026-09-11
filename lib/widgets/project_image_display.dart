import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

/// Displays project image with fallback to gradient placeholder
class ProjectImageDisplay extends StatelessWidget {
  final String? imagePath;
  final double height;
  final IconData placeholderIcon;
  final String? projectTitle;

  const ProjectImageDisplay({
    super.key,
    this.imagePath,
    this.height = 300,
    this.placeholderIcon = Icons.app_settings_alt,
    this.projectTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryColor.withOpacity(0.3),
            AppTheme.secondaryColor.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: imagePath != null
          ? Image.asset(
              imagePath!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholder();
              },
            )
          : _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Stack(
      children: [
        // Background gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryColor.withOpacity(0.1),
                AppTheme.secondaryColor.withOpacity(0.2),
                AppTheme.primaryColor.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
        // Icon
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                placeholderIcon,
                size: 60,
                color: AppTheme.primaryColor.withOpacity(0.7),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  'App Screenshot',
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Project title overlay (if provided)
        if (projectTitle != null)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingL,
                vertical: AppTheme.spacingM,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.cardColor.withOpacity(0.9),
                    AppTheme.cardColor.withOpacity(0.7),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Text(
                projectTitle!,
                style: AppTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

/// Screenshot gallery viewer for projects
class ProjectScreenshotGallery extends StatefulWidget {
  final List<String> screenshots;
  final double height;

  const ProjectScreenshotGallery({
    super.key,
    required this.screenshots,
    this.height = 300,
  });

  @override
  State<ProjectScreenshotGallery> createState() =>
      _ProjectScreenshotGalleryState();
}

class _ProjectScreenshotGalleryState extends State<ProjectScreenshotGallery> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.screenshots.isEmpty) {
      return ProjectImageDisplay(height: widget.height);
    }

    return Stack(
      children: [
        // Main image
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: ProjectImageDisplay(
            key: ValueKey(_currentIndex),
            imagePath: widget.screenshots[_currentIndex],
            height: widget.height,
          ),
        ),

        // Navigation buttons
        if (widget.screenshots.length > 1) ...[
          // Previous button
          Positioned(
            left: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                onPressed: _previousImage,
                icon: const Icon(Icons.chevron_left),
                color: Colors.white,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          // Next button
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                onPressed: _nextImage,
                icon: const Icon(Icons.chevron_right),
                color: Colors.white,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          // Indicators
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.screenshots.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == _currentIndex
                        ? AppTheme.primaryColor
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % widget.screenshots.length;
      if (_currentIndex < 0) _currentIndex = widget.screenshots.length - 1;
    });
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.screenshots.length;
    });
  }
}
