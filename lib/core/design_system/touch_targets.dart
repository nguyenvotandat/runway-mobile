import 'package:flutter/material.dart';
import 'screen_sizes.dart';

/// Touch target optimization following Material Design accessibility guidelines
/// Ensures proper touch target sizes for different devices and input methods
class TouchTargets {
  // Material Design minimum touch target sizes
  static const double minTouchTarget = 48.0;
  static const double recommendedTouchTarget = 56.0;
  
  /// Get optimal touch target size based on screen type and input method
  static double getOptimalTouchTarget(BuildContext context) {
    final screenType = ScreenSizes.getScreenType(context);
    
    switch (screenType) {
      case ScreenType.mobile:
        return minTouchTarget;      // 48px minimum for touch
      case ScreenType.largeMobile:
        return 52.0;
      case ScreenType.tablet:
        return recommendedTouchTarget; // 56px recommended
      case ScreenType.desktop:
        return 40.0;                // Can be smaller with mouse precision
      case ScreenType.largeDesktop:
        return 44.0;
    }
  }
  
  /// Get minimum spacing between touch targets
  static double getTouchTargetSpacing(BuildContext context) {
    final screenType = ScreenSizes.getScreenType(context);
    
    switch (screenType) {
      case ScreenType.mobile:
      case ScreenType.largeMobile:
        return 8.0;  // More spacing on mobile
      case ScreenType.tablet:
        return 12.0;
      case ScreenType.desktop:
      case ScreenType.largeDesktop:
        return 4.0;  // Less spacing needed with mouse
    }
  }
  
  /// Ensure widget meets minimum touch target requirements
  static Widget ensureMinTouchTarget({
    required Widget child,
    required BuildContext context,
    VoidCallback? onTap,
    EdgeInsets? padding,
  }) {
    final minSize = getOptimalTouchTarget(context);
    
    return SizedBox(
      width: minSize,
      height: minSize,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(minSize / 2),
        child: Padding(
          padding: padding ?? EdgeInsets.all(4.0),
          child: Center(child: child),
        ),
      ),
    );
  }
  
  /// Create a properly sized button with minimum touch target
  static Widget createButton({
    required Widget child,
    required BuildContext context,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsets? padding,
  }) {
    final minSize = getOptimalTouchTarget(context);
    
    return SizedBox(
      height: minSize,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.0),
          minimumSize: Size(0, minSize),
        ),
        child: child,
      ),
    );
  }
}