import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  /// Get current theme data
  ThemeData get theme => Theme.of(this);

  /// Get current text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get current color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Check if current theme is dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Get primary color
  Color get primaryColor => Theme.of(this).colorScheme.primary;

  /// Get secondary color
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  /// Get surface color
  Color get surfaceColor => Theme.of(this).colorScheme.surface;

  /// Get background color
  Color get backgroundColor => Theme.of(this).colorScheme.background;

  /// Get text color based on theme
  Color get textColor => Theme.of(this).colorScheme.onSurface;

  /// Get screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Check if screen is small (mobile)
  bool get isSmallScreen => screenWidth < 600;

  /// Check if screen is medium (tablet)
  bool get isMediumScreen => screenWidth >= 600 && screenWidth < 1024;

  /// Check if screen is large (desktop)
  bool get isLargeScreen => screenWidth >= 1024;

  /// Show snackbar with message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Show error snackbar
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: colorScheme.error),
    );
  }
}
