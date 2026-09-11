import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF64B5F6);
  static const Color secondaryColor = Color(0xFF42A5F5);
  static const Color accentColor = Color(0xFF2196F3);
  static const Color backgroundColor = Color(0xFF0A0E27);
  static const Color surfaceColor = Color(0xFF161B33);
  static const Color cardColor = Color(0xFF1E2440);
  static const Color textPrimaryColor = Color(0xFFFFFFFF);
  static const Color textSecondaryColor = Color(0xFFB0BEC5);
  static const Color borderColor = Color(0xFF2C3454);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, accentColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [backgroundColor, Color(0xFF141937)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Text Styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
    letterSpacing: -0.5,
    height: 1.1,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
    letterSpacing: -0.3,
    height: 1.3,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
    height: 1.4,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: textSecondaryColor,
    height: 1.6,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textSecondaryColor,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textSecondaryColor,
    height: 1.5,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
    letterSpacing: 0.5,
  );

  // Spacing
  static const double spacingXs = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;
  static const double spacingXxxl = 64.0;

  // Border Radius
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXl = 16.0;
  static const double radiusXxl = 24.0;

  // Breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  // Max Content Width
  static const double maxContentWidth = 1200;

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        onPrimary: textPrimaryColor,
        onSecondary: textPrimaryColor,
        onSurface: textPrimaryColor,
        error: Colors.redAccent,
        onError: textPrimaryColor,
      ),
      textTheme: const TextTheme(
        displayLarge: heading1,
        displayMedium: heading2,
        displaySmall: heading3,
        headlineMedium: heading4,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: button,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacingL,
          vertical: spacingM,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: spacingXl,
            vertical: spacingM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusM),
          ),
          elevation: 0,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusL),
          side: const BorderSide(color: borderColor, width: 1),
        ),
      ),
    );
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }
}
