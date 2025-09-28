import 'package:flutter/material.dart';

/// Screen size detection and responsive breakpoints following Material Design
/// guidelines and industry best practices
class ScreenSizes {
  // Material Design breakpoints
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  static const double largeDesktop = 1600;
  
  /// Get screen type based on current context
  static ScreenType getScreenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    if (width < mobile) return ScreenType.mobile;
    if (width < tablet) return ScreenType.largeMobile;
    if (width < desktop) return ScreenType.tablet;
    if (width < largeDesktop) return ScreenType.desktop;
    return ScreenType.largeDesktop;
  }
  
  /// Get optimal grid columns for product layout
  static int getGridColumns(BuildContext context) {
    final screenType = getScreenType(context);
    
    switch (screenType) {
      case ScreenType.mobile:
        return 2;
      case ScreenType.largeMobile:
        return 2;
      case ScreenType.tablet:
        return 3;
      case ScreenType.desktop:
        return 4;
      case ScreenType.largeDesktop:
        return 5;
    }
  }
  
  /// Get optimal card aspect ratio for different screen sizes
  static double getCardAspectRatio(BuildContext context) {
    final screenType = getScreenType(context);
    
    switch (screenType) {
      case ScreenType.mobile:
        return 0.65;  // Taller on mobile for more content
      case ScreenType.largeMobile:
        return 0.7;
      case ScreenType.tablet:
        return 0.75;
      case ScreenType.desktop:
        return 0.8;
      case ScreenType.largeDesktop:
        return 0.85;  // More square on large screens
    }
  }
  
  /// Check if current screen is mobile size
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobile;
  }
  
  /// Check if current screen is tablet size
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobile && width < desktop;
  }
  
  /// Check if current screen is desktop size
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }
  
  /// Get safe area padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }
  
  /// Get usable screen height (excluding system UI)
  static double getUsableHeight(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height - 
           mediaQuery.padding.top - 
           mediaQuery.padding.bottom;
  }
  
  /// Check if device has notch or system UI cutouts
  static bool hasNotch(BuildContext context) {
    return MediaQuery.of(context).padding.top > 30;
  }
}

/// Enum defining different screen size categories
enum ScreenType {
  mobile,        // < 600px
  largeMobile,   // 600px - 900px  
  tablet,        // 900px - 1200px
  desktop,       // 1200px - 1600px
  largeDesktop,  // > 1600px
}