import 'package:flutter/material.dart';
import 'screen_sizes.dart';

/// 🎯 Adaptive image sizing system with percentage-based responsive calculations
///
/// **Key Concept: Logical Pixels vs Physical Pixels**
///
/// This system uses **logical pixels (dp/dip)** consistently:
/// - ✅ **Logical pixels**: Device-independent pixels that Flutter uses for layouts
/// - ❌ **Physical pixels**: Raw screen pixels (varies by device density)
///
/// **Why Logical Pixels?**
/// - 📱 **Consistency**: Same visual size across all devices
/// - 🎨 **Layout**: Widget dimensions are always in logical pixels
/// - ⚡ **Performance**: Flutter handles pixel ratio conversion automatically
/// - 🔧 **Maintenance**: No manual pixel ratio calculations needed
///
/// **Example:**
/// ```dart
/// // ✅ CORRECT: All dimensions in logical pixels
/// ImageDimensions(width: 200, height: 250)  // 200dp × 250dp
/// SizedBox(width: 200, height: 250)         // Same logical size
///
/// // ❌ WRONG: Mixing logical and physical pixels
/// ImageDimensions(width: 200 * pixelRatio, height: 250 * pixelRatio)
/// SizedBox(width: 200, height: 250)  // Size mismatch!
/// ```
class AdaptiveImageSize {
  /// Calculate optimal image size based on percentage of screen width
  ///
  /// Returns dimensions in logical pixels for consistency with widget sizing
  static ImageDimensions getOptimalImageDimensions(
    BuildContext context, {
    ImageType imageType = ImageType.productCard,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenType = ScreenSizes.getScreenType(context);

    // Get percentage-based dimensions in logical pixels
    return _getPercentageBasedDimensions(screenWidth, screenType, imageType);
  }

  /// Generate optimized image URL with size and quality parameters
  static String getOptimalImageUrl(
    BuildContext context,
    String baseUrl, {
    ImageType imageType = ImageType.productCard,
    ImageQuality quality = ImageQuality.auto,
  }) {
    final dimensions = getOptimalImageDimensions(context, imageType: imageType);

    // Add size and quality parameters to the URL
    // This assumes your backend supports image resizing with query parameters
    final separator = baseUrl.contains('?') ? '&' : '?';
    return '${baseUrl}${separator}w=${dimensions.width}&h=${dimensions.height}&q=${quality.value}';
  }

  /// Get column-aware image dimensions for grid layouts
  static ImageDimensions getGridImageDimensions(
    BuildContext context, {
    int? forceColumns,
    double gridSpacing = 16.0,
    double screenMargin = 16.0,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final columns = forceColumns ?? ScreenSizes.getGridColumns(context);

    // Calculate available width: screen - margins - spacing between columns
    final availableWidth =
        screenWidth - (screenMargin * 2) - (gridSpacing * (columns - 1));
    final cardWidth = availableWidth / columns;

    // Standard aspect ratio for product cards
    final aspectRatio = ScreenSizes.getCardAspectRatio(context);
    final cardHeight = cardWidth / aspectRatio;

    // Return logical pixels - Flutter automatically handles device pixel ratio
    return ImageDimensions(
      width: cardWidth.round(),
      height: cardHeight.round(),
    );
  }

  /// Calculate dimensions based on screen width percentage
  static ImageDimensions _getPercentageBasedDimensions(
    double screenWidth,
    ScreenType screenType,
    ImageType imageType,
  ) {
    switch (imageType) {
      case ImageType.productCard:
        return _getProductCardPercentageDimensions(screenWidth, screenType);
      case ImageType.productDetail:
        return _getProductDetailPercentageDimensions(screenWidth, screenType);
      case ImageType.thumbnail:
        return _getThumbnailPercentageDimensions(screenWidth, screenType);
      case ImageType.hero:
        return _getHeroPercentageDimensions(screenWidth, screenType);
    }
  }

  static ImageDimensions _getProductCardPercentageDimensions(
    double screenWidth,
    ScreenType screenType,
  ) {
    double widthPercentage;
    double aspectRatio = 4 / 5; // Standard product card ratio (0.8)

    switch (screenType) {
      case ScreenType.mobile:
        // 2 columns with padding: (100% - 3*16px) / 2 ≈ 45%
        widthPercentage = 0.45;
        break;
      case ScreenType.largeMobile:
        // Still 2 columns but slightly smaller
        widthPercentage = 0.42;
        break;
      case ScreenType.tablet:
        // 3 columns: (100% - 4*16px) / 3 ≈ 30%
        widthPercentage = 0.30;
        break;
      case ScreenType.desktop:
        // 4 columns: (100% - 5*16px) / 4 ≈ 22%
        widthPercentage = 0.22;
        break;
      case ScreenType.largeDesktop:
        // 5 columns: (100% - 6*16px) / 5 ≈ 18%
        widthPercentage = 0.18;
        break;
    }

    final cardWidth = screenWidth * widthPercentage;
    final cardHeight = cardWidth / aspectRatio;

    // Return logical pixels - ensures consistency with widget sizing
    return ImageDimensions(
      width: cardWidth.round(),
      height: cardHeight.round(),
    );
  }

  static ImageDimensions _getProductDetailPercentageDimensions(
    double screenWidth,
    ScreenType screenType,
  ) {
    double widthPercentage;
    double aspectRatio = 3 / 4; // Taller for detail view

    switch (screenType) {
      case ScreenType.mobile:
        widthPercentage = 0.90; // Almost full width
        break;
      case ScreenType.largeMobile:
        widthPercentage = 0.85;
        break;
      case ScreenType.tablet:
        widthPercentage = 0.60; // Side by side with info
        break;
      case ScreenType.desktop:
        widthPercentage = 0.40; // Smaller portion on desktop
        break;
      case ScreenType.largeDesktop:
        widthPercentage = 0.30;
        break;
    }

    final imageWidth = screenWidth * widthPercentage;
    final imageHeight = imageWidth / aspectRatio;

    return ImageDimensions(
      width: imageWidth.round(),
      height: imageHeight.round(),
    );
  }

  static ImageDimensions _getThumbnailPercentageDimensions(
    double screenWidth,
    ScreenType screenType,
  ) {
    // Thumbnails có fixed ratio nhưng scale theo screen
    double baseSize;

    switch (screenType) {
      case ScreenType.mobile:
        baseSize = screenWidth * 0.15; // 15% of screen width
        break;
      case ScreenType.largeMobile:
        baseSize = screenWidth * 0.12;
        break;
      case ScreenType.tablet:
        baseSize = screenWidth * 0.10;
        break;
      case ScreenType.desktop:
        baseSize = screenWidth * 0.08;
        break;
      case ScreenType.largeDesktop:
        baseSize = screenWidth * 0.06;
        break;
    }

    return ImageDimensions(
      width: baseSize.round(),
      height: baseSize.round(), // Square thumbnails
    );
  }

  static ImageDimensions _getHeroPercentageDimensions(
    double screenWidth,
    ScreenType screenType,
  ) {
    double aspectRatio = 16 / 9; // Widescreen ratio for hero images
    double widthPercentage = 1.0; // Full width for hero

    final heroWidth = screenWidth * widthPercentage;
    final heroHeight = heroWidth / aspectRatio;

    return ImageDimensions(
      width: heroWidth.round(),
      height: heroHeight.round(),
    );
  }

  /// Get memory cache height for images (for CachedNetworkImage)
  ///
  /// Returns logical pixels - Flutter automatically converts to physical pixels
  /// for actual memory allocation based on device pixel ratio
  static int getMemoryCacheHeight(BuildContext context, ImageType imageType) {
    final dimensions = getOptimalImageDimensions(context, imageType: imageType);
    return dimensions.height;
  }

  /// Get disk cache height for images (for CachedNetworkImage)
  ///
  /// Returns logical pixels - slightly larger for better quality
  static int getDiskCacheHeight(BuildContext context, ImageType imageType) {
    final dimensions = getOptimalImageDimensions(context, imageType: imageType);
    return (dimensions.height * 1.5)
        .round(); // Store slightly larger for better quality in logical pixels
  }
}

/// Image dimensions data class
class ImageDimensions {
  final int width;
  final int height;

  const ImageDimensions({required this.width, required this.height});

  @override
  String toString() => 'ImageDimensions(width: $width, height: $height)';
}

/// Different image types used throughout the app
enum ImageType {
  productCard, // Product card images
  productDetail, // Product detail page images
  thumbnail, // Small thumbnail images
  hero, // Hero/banner images
}

/// Image quality settings for different use cases
enum ImageQuality {
  low(30), // For slow connections
  medium(60), // Default quality
  high(80), // For high-quality displays
  auto(70); // Automatic quality based on connection

  const ImageQuality(this.value);
  final int value;
}
