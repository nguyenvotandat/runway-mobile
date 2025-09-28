import 'package:flutter/material.dart';
import 'screen_sizes.dart';

/// Adaptive image loading utilities for optimal performance and bandwidth usage
/// Provides different image sizes and quality based on device capabilities
class AdaptiveImageSize {
  /// Calculate optimal image size based on screen size and pixel ratio
  static ImageDimensions getOptimalImageDimensions(
    BuildContext context, {
    ImageType imageType = ImageType.productCard,
  }) {
    final screenType = ScreenSizes.getScreenType(context);
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;

    final baseDimensions = _getBaseDimensions(screenType, imageType);

    return ImageDimensions(
      width: (baseDimensions.width * pixelRatio).round(),
      height: (baseDimensions.height * pixelRatio).round(),
    );
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

  /// Get base image dimensions for different screen types and image uses
  static ImageDimensions _getBaseDimensions(
    ScreenType screenType,
    ImageType imageType,
  ) {
    switch (imageType) {
      case ImageType.productCard:
        return _getProductCardDimensions(screenType);
      case ImageType.productDetail:
        return _getProductDetailDimensions(screenType);
      case ImageType.thumbnail:
        return _getThumbnailDimensions(screenType);
      case ImageType.hero:
        return _getHeroDimensions(screenType);
    }
  }

  static ImageDimensions _getProductCardDimensions(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
        return const ImageDimensions(width: 180, height: 240);
      case ScreenType.largeMobile:
        return const ImageDimensions(width: 200, height: 280);
      case ScreenType.tablet:
        return const ImageDimensions(width: 240, height: 320);
      case ScreenType.desktop:
        return const ImageDimensions(width: 280, height: 360);
      case ScreenType.largeDesktop:
        return const ImageDimensions(width: 320, height: 400);
    }
  }

  static ImageDimensions _getProductDetailDimensions(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
        return const ImageDimensions(width: 360, height: 480);
      case ScreenType.largeMobile:
        return const ImageDimensions(width: 400, height: 560);
      case ScreenType.tablet:
        return const ImageDimensions(width: 500, height: 680);
      case ScreenType.desktop:
        return const ImageDimensions(width: 600, height: 800);
      case ScreenType.largeDesktop:
        return const ImageDimensions(width: 700, height: 920);
    }
  }

  static ImageDimensions _getThumbnailDimensions(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
        return const ImageDimensions(width: 60, height: 60);
      case ScreenType.largeMobile:
        return const ImageDimensions(width: 80, height: 80);
      case ScreenType.tablet:
        return const ImageDimensions(width: 100, height: 100);
      case ScreenType.desktop:
        return const ImageDimensions(width: 120, height: 120);
      case ScreenType.largeDesktop:
        return const ImageDimensions(width: 140, height: 140);
    }
  }

  static ImageDimensions _getHeroDimensions(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
        return const ImageDimensions(width: 400, height: 200);
      case ScreenType.largeMobile:
        return const ImageDimensions(width: 500, height: 250);
      case ScreenType.tablet:
        return const ImageDimensions(width: 800, height: 400);
      case ScreenType.desktop:
        return const ImageDimensions(width: 1200, height: 600);
      case ScreenType.largeDesktop:
        return const ImageDimensions(width: 1600, height: 800);
    }
  }

  /// Get memory cache height for images (for CachedNetworkImage)
  static int getMemoryCacheHeight(BuildContext context, ImageType imageType) {
    final dimensions = getOptimalImageDimensions(context, imageType: imageType);
    return dimensions.height;
  }

  /// Get disk cache height for images (for CachedNetworkImage)
  static int getDiskCacheHeight(BuildContext context, ImageType imageType) {
    final dimensions = getOptimalImageDimensions(context, imageType: imageType);
    return (dimensions.height * 1.5)
        .round(); // Store slightly larger for better quality
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
