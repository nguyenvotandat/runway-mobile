import 'package:flutter/material.dart';
import 'screen_sizes.dart';

/// Typography system with responsive font sizes and consistent text styles
/// Follows Material Design type scale and accessibility guidelines
class AppTypography {
  // Base font size ratios for different screen types
  static const Map<ScreenType, double> _fontScaleFactors = {
    ScreenType.mobile: 1.0,
    ScreenType.largeMobile: 1.05,
    ScreenType.tablet: 1.1,
    ScreenType.desktop: 1.2,
    ScreenType.largeDesktop: 1.3,
  };

  /// Get font scale factor based on screen size
  static double _getScaleFactor(BuildContext context) {
    final screenType = ScreenSizes.getScreenType(context);
    return _fontScaleFactors[screenType] ?? 1.0;
  }

  /// Product card title font size
  static double titleSize(BuildContext context) {
    return 14.0 * _getScaleFactor(context);
  }

  /// Product price font size
  static double priceSize(BuildContext context) {
    return 16.0 * _getScaleFactor(context);
  }

  /// Product brand/category font size
  static double captionSize(BuildContext context) {
    return 12.0 * _getScaleFactor(context);
  }

  /// Body text font size
  static double bodySize(BuildContext context) {
    return 14.0 * _getScaleFactor(context);
  }

  /// Small text font size
  static double smallSize(BuildContext context) {
    return 11.0 * _getScaleFactor(context);
  }

  /// Heading font size
  static double headingSize(BuildContext context) {
    return 20.0 * _getScaleFactor(context);
  }

  /// Subheading font size
  static double subheadingSize(BuildContext context) {
    return 16.0 * _getScaleFactor(context);
  }

  // Text style getters with responsive sizes

  /// Product title text style
  static TextStyle titleStyle(BuildContext context) {
    return TextStyle(
      fontSize: titleSize(context),
      fontWeight: FontWeight.w600,
      height: 1.2,
    );
  }

  /// Product price text style
  static TextStyle priceStyle(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: priceSize(context),
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  /// Product brand/category text style
  static TextStyle captionStyle(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: captionSize(context),
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  /// Body text style
  static TextStyle bodyStyle(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: bodySize(context),
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  /// Small text style
  static TextStyle smallStyle(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: smallSize(context),
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  /// Heading text style
  static TextStyle headingStyle(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: headingSize(context),
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  /// Subheading text style
  static TextStyle subheadingStyle(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: subheadingSize(context),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  /// Get maximum lines for title based on screen size
  static int getTitleMaxLines(BuildContext context) {
    final screenType = ScreenSizes.getScreenType(context);

    switch (screenType) {
      case ScreenType.mobile:
      case ScreenType.largeMobile:
        return 2;
      case ScreenType.tablet:
      case ScreenType.desktop:
      case ScreenType.largeDesktop:
        return 3;
    }
  }
}
