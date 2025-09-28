import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math' as math;
import '../../../features/product/domain/entities/product_entity.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/design_system/screen_sizes.dart';
import '../../../core/design_system/app_spacing.dart';
import '../../../core/design_system/app_typography.dart';
import '../../../core/design_system/touch_targets.dart';
import '../../../core/design_system/adaptive_image.dart';

class ResponsiveProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onTap;

  const ResponsiveProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _getElevation(context),
      margin: EdgeInsets.all(
        AppSpacing.responsive(
          context,
          mobile: AppSpacing.xs,
          tablet: AppSpacing.sm,
          desktop: AppSpacing.md,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getBorderRadius(context)),
      ),
      child: InkWell(
        onTap: onTap ?? () => _onProductTapped(context),
        borderRadius: BorderRadius.circular(_getBorderRadius(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildProductImage(context), _buildProductInfo(context)],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    final screenType = ScreenSizes.getScreenType(context);
    final imageHeight = _getImageHeight(screenType);

    return Container(
      height: imageHeight,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(_getBorderRadius(context)),
            ),
            child: CachedNetworkImage(
              imageUrl: AdaptiveImageSize.getOptimalImageUrl(
                context,
                product.images.isNotEmpty ? product.images.first.url : '',
                imageType: ImageType.productCard,
                quality: ImageQuality.auto,
              ),
              width: double.infinity,
              height: imageHeight,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
                child: Center(
                  child: SizedBox(
                    width: _getLoadingSize(screenType),
                    height: _getLoadingSize(screenType),
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[200],
                child: Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: _getIconSize(screenType),
                    color: Colors.grey[400],
                  ),
                ),
              ),
              memCacheHeight: AdaptiveImageSize.getMemoryCacheHeight(
                context,
                ImageType.productCard,
              ),
              maxHeightDiskCache: AdaptiveImageSize.getDiskCacheHeight(
                context,
                ImageType.productCard,
              ),
            ),
          ),

          // Favorite Button
          Positioned(
            top: AppSpacing.sm,
            right: AppSpacing.sm,
            child: TouchTargets.ensureMinTouchTarget(
              context: context,
              onTap: () => _onFavoritePressed(context),
              child: Container(
                padding: EdgeInsets.all(AppSpacing.xs),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Icon(
                  Icons
                      .favorite_border, // TODO: Implement favorite functionality
                  color: Colors.grey,
                  size: AppTypography.captionSize(context),
                ),
              ),
            ),
          ),

          // TODO: Implement discount badge when needed
        ],
      ),
    );
  }

  Widget _buildProductInfo(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: AppSpacing.cardPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBrand(context),
                SizedBox(height: AppSpacing.xs / 2),
                _buildProductTitle(context),
                SizedBox(height: AppSpacing.xs),
                _buildRating(context),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSpacing.sm),
                _buildProductPrice(context),
                if (_shouldShowActionButtons(context))
                  _buildActionButtons(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrand(BuildContext context) {
    return Text(
      product.brand.name,
      style: AppTypography.captionStyle(context, color: Colors.grey[600]),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductTitle(BuildContext context) {
    return Text(
      product.name,
      style: AppTypography.titleStyle(context),
      maxLines: AppTypography.getTitleMaxLines(context),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRating(BuildContext context) {
    if (product.ratingAverage == null || product.ratingAverage == 0) {
      return SizedBox.shrink();
    }

    final iconSize = AppTypography.captionSize(context);

    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: iconSize + 2),
        SizedBox(width: AppSpacing.xs / 2),
        Text(
          product.ratingAverage!.toStringAsFixed(1),
          style: AppTypography.captionStyle(context),
        ),
        SizedBox(width: AppSpacing.xs / 2),
        Text(
          '(${product.ratingCount})',
          style: AppTypography.smallStyle(context, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildProductPrice(BuildContext context) {
    return Text(
      _getDisplayPrice(),
      style: AppTypography.priceStyle(
        context,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: TouchTargets.createButton(
              context: context,
              onPressed: () => _onAddToCartPressed(context),
              child: Text(
                'Thêm vào giỏ',
                style: TextStyle(fontSize: AppTypography.captionSize(context)),
              ),
            ),
          ),
          SizedBox(width: AppSpacing.xs),
          TouchTargets.ensureMinTouchTarget(
            context: context,
            onTap: () => _onFavoritePressed(context),
            child: Icon(
              Icons.favorite_border,
              size: AppTypography.titleSize(context),
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods for responsive values
  double _getElevation(BuildContext context) {
    final screenType = ScreenSizes.getScreenType(context);
    switch (screenType) {
      case ScreenType.mobile:
      case ScreenType.largeMobile:
        return 2.0;
      default:
        return 4.0;
    }
  }

  double _getBorderRadius(BuildContext context) {
    final screenType = ScreenSizes.getScreenType(context);
    switch (screenType) {
      case ScreenType.mobile:
        return 8.0;
      case ScreenType.largeMobile:
        return 10.0;
      default:
        return 12.0;
    }
  }

  double _getImageHeight(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
        return 120.0;
      case ScreenType.largeMobile:
        return 140.0;
      case ScreenType.tablet:
        return 160.0;
      case ScreenType.desktop:
        return 180.0;
      case ScreenType.largeDesktop:
        return 200.0;
    }
  }

  double _getLoadingSize(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
      case ScreenType.largeMobile:
        return 20.0;
      default:
        return 28.0;
    }
  }

  double _getIconSize(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
      case ScreenType.largeMobile:
        return 32.0;
      default:
        return 40.0;
    }
  }

  bool _shouldShowActionButtons(BuildContext context) {
    final screenType = ScreenSizes.getScreenType(context);
    return screenType != ScreenType.mobile &&
        screenType != ScreenType.largeMobile;
  }

  String _getDisplayPrice() {
    if (product.variants.isNotEmpty) {
      final prices = product.variants
          .map((v) => v.currentPrice)
          .where((price) => price != null && price > 0)
          .cast<double>()
          .toList();

      if (prices.isNotEmpty) {
        final minPrice = prices.reduce(math.min);
        return '${minPrice.toStringAsFixed(0)}₫';
      }
    }
    return 'Liên hệ để biết giá';
  }

  void _onProductTapped(BuildContext context) {
    Navigator.pushNamed(context, '/product-detail', arguments: product.id);
  }

  void _onFavoritePressed(BuildContext context) {
    // TODO: Implement favorite functionality
    context.showSnackBar('Tính năng yêu thích đang phát triển');
  }

  void _onAddToCartPressed(BuildContext context) {
    // TODO: Implement add to cart functionality
    context.showSnackBar('Tính năng thêm vào giỏ hàng đang phát triển');
  }
}
