import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/portfolio_data.dart';

class Navbar extends StatefulWidget {
  final Function(String) onNavigate;

  const Navbar({
    super.key,
    required this.onNavigate,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isScrolled = false;
  String _hoveredItem = '';

  static const List<Map<String, String>> _menuItems = [
    {'label': 'Home', 'id': 'home'},
    {'label': 'About', 'id': 'about'},
    {'label': 'Skills', 'id': 'skills'},
    {'label': 'Projects', 'id': 'projects'},
    {'label': 'Experience', 'id': 'experience'},
    {'label': 'Services', 'id': 'services'},
    {'label': 'Contact', 'id': 'contact'},
  ];

  @override
  void initState() {
    super.initState();
    // In a real implementation, you would listen to scroll controller here
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppTheme.isMobile(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _isScrolled
            ? AppTheme.surfaceColor.withOpacity(0.95)
            : Colors.transparent,
        boxShadow: _isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? AppTheme.spacingL : AppTheme.spacingXxxl,
            vertical: AppTheme.spacingL,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogo(),
              if (!isMobile) _buildDesktopMenu() else _buildMobileMenuButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: () => widget.onNavigate('home'),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
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
                    fontSize: 18,
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
                  style: AppTheme.bodySmall.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      children: _menuItems.map((item) {
        final isHovered = _hoveredItem == item['id'];
        return Padding(
          padding: const EdgeInsets.only(left: AppTheme.spacingXl),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _hoveredItem = item['id']!),
            onExit: (_) => setState(() => _hoveredItem = ''),
            child: GestureDetector(
              onTap: () => widget.onNavigate(item['id']!),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: AppTheme.bodyMedium.copyWith(
                  color: isHovered
                      ? AppTheme.primaryColor
                      : AppTheme.textPrimaryColor,
                  fontWeight: isHovered ? FontWeight.w600 : FontWeight.normal,
                ),
                child: Text(item['label']!),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileMenuButton() {
    return IconButton(
      icon: const Icon(Icons.menu, color: AppTheme.textPrimaryColor),
      onPressed: () {
        _showMobileMenu(context);
      },
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surfaceColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXl),
        ),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppTheme.spacingM),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.borderColor,
                borderRadius: BorderRadius.circular(AppTheme.radiusS),
              ),
            ),
            const SizedBox(height: AppTheme.spacingL),
            ..._menuItems.map((item) {
              return ListTile(
                title: Text(
                  item['label']!,
                  style: AppTheme.bodyLarge,
                ),
                onTap: () {
                  Navigator.pop(context);
                  widget.onNavigate(item['id']!);
                },
              );
            }),
            const SizedBox(height: AppTheme.spacingL),
          ],
        ),
      ),
    );
  }
}
