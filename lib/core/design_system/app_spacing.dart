import 'package:flutter/material.dart';
import 'screen_sizes.dart';

/// Spacing system following 8px grid system for consistent design
/// All spacing values are multiples of 8px for better visual rhythm
class AppSpacing {
  // Base spacing unit - 8px system (Material Design standard)
  static const double _unit = 8.0;

  // Fixed spacing values
  static const double xs = _unit * 0.5; // 4px
  static const double sm = _unit * 1; // 8px
  static const double md = _unit * 2; // 16px
  static const double lg = _unit * 3; // 24px
  static const double xl = _unit * 4; // 32px
  static const double xxl = _unit * 6; // 48px

  /// Get responsive spacing value based on screen size
  static double responsive(
    BuildContext context, {
    double mobile = md,
    double tablet = lg,
    double desktop = xl,
  }) {
    final screenType = ScreenSizes.getScreenType(context);

    switch (screenType) {
      case ScreenType.mobile:
      case ScreenType.largeMobile:
        return mobile;
      case ScreenType.tablet:
        return tablet;
      case ScreenType.desktop:
      case ScreenType.largeDesktop:
        return desktop;
    }
  }

  /// Get card padding based on screen size
  static EdgeInsets cardPadding(BuildContext context) {
    final spacing = responsive(context, mobile: sm, tablet: md, desktop: lg);
    return EdgeInsets.all(spacing);
  }

  /// Get grid spacing between items
  static double gridSpacing(BuildContext context) {
    return responsive(context, mobile: sm, tablet: md, desktop: lg);
  }

  /// Get screen margin for main content
  static EdgeInsets screenMargin(BuildContext context) {
    final horizontal = responsive(context, mobile: md, tablet: lg, desktop: xl);
    final vertical = responsive(context, mobile: sm, tablet: md, desktop: lg);
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  /// Get list item padding
  static EdgeInsets listItemPadding(BuildContext context) {
    final horizontal = responsive(context, mobile: md, tablet: lg, desktop: xl);
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: sm);
  }

  /// Get button padding based on screen size
  static EdgeInsets buttonPadding(BuildContext context) {
    final horizontal = responsive(context, mobile: md, tablet: lg, desktop: xl);
    final vertical = responsive(context, mobile: sm, tablet: sm, desktop: md);
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }
}
