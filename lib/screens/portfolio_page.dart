import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/projects_section.dart';
import '../widgets/services_section.dart';
import '../widgets/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'projects': GlobalKey(),
    'experience': GlobalKey(),
    'services': GlobalKey(),
    'contact': GlobalKey(),
  };

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 500 && !_showBackToTop) {
      setState(() => _showBackToTop = true);
    } else if (_scrollController.offset <= 500 && _showBackToTop) {
      setState(() => _showBackToTop = false);
    }
  }

  void _scrollToSection(String sectionId) {
    final key = _sectionKeys[sectionId];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Hero Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['home'],
                  child: HeroSection(
                    onContactPressed: () => _scrollToSection('contact'),
                    onProjectsPressed: () => _scrollToSection('projects'),
                  ),
                ),
              ),
              
              // About Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['about'],
                  child: const AboutSection(),
                ),
              ),
              
              // Skills Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['skills'],
                  child: const SkillsSection(),
                ),
              ),
              
              // Projects Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['projects'],
                  child: const ProjectsSection(),
                ),
              ),
              
              // Experience Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['experience'],
                  child: const ExperienceSection(),
                ),
              ),
              
              // Services Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['services'],
                  child: const ServicesSection(),
                ),
              ),
              
              // Contact Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['contact'],
                  child: const ContactSection(),
                ),
              ),
              
              // Footer
              const SliverToBoxAdapter(
                child: Footer(),
              ),
            ],
          ),
          
          // Fixed Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onNavigate: _scrollToSection,
            ),
          ),
          
          // Back to top button
          if (_showBackToTop)
            Positioned(
              bottom: AppTheme.spacingXl,
              right: AppTheme.spacingXl,
              child: _BackToTopButton(
                onPressed: _scrollToTop,
              ),
            ),
        ],
      ),
    );
  }
}

class _BackToTopButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _BackToTopButton({
    required this.onPressed,
  });

  @override
  State<_BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<_BackToTopButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.4),
                blurRadius: _isHovered ? 20 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onPressed,
              customBorder: const CircleBorder(),
              child: const Icon(
                Icons.keyboard_arrow_up,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
