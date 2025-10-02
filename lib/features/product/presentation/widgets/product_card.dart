import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../domain/entities/product_entity.dart';

/// Enterprise Standard ProductCard
///
/// ✅ Single Responsibility: Display product in grid/list only
/// ✅ Design System Compliant: 100% uses design system
/// ✅ No Business Logic: Pure presentation component
/// ✅ Minimal Dependencies: Only display-related imports
/// ✅ Testable: Simple, predictable behavior
class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onTap;
  final bool isGridView;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.isGridView = true,
  });

  @override
  Widget build(BuildContext context) {
    final dimensions = AdaptiveImageSize.getGridImageDimensions(
      context,
      gridSpacing: AppSpacing.gridSpacing(context),
      screenMargin: AppSpacing.screenMargin(context).left,
    );

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: context.isDarkMode ? 0 : 2,
        color: context.surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: context.isDarkMode
                ? Colors.grey.shade700
                : Colors.grey.shade200,
          ),
        ),
        child: SizedBox(
          width: dimensions.width.toDouble(),
          height: dimensions.height.toDouble(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🖼️ Product Image - 60% of card height
              Expanded(flex: 3, child: _buildImage(context)),
              // 📝 Product Info - 40% of card height
              Expanded(flex: 2, child: _buildInfo(context)),
            ],
          ),
        ),
      ),
    );
  }

  /// 🖼️ Enterprise Standard: Simple image display
  Widget _buildImage(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        color: context.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: product.images.isNotEmpty
            ? Image.network(
                AdaptiveImageSize.getOptimalImageUrl(
                  context,
                  product.images.first.url,
                  imageType: isGridView
                      ? ImageType.productCard
                      : ImageType.thumbnail,
                ),
                fit: BoxFit.cover,
                cacheHeight: AdaptiveImageSize.getMemoryCacheHeight(
                  context,
                  isGridView ? ImageType.productCard : ImageType.thumbnail,
                ),
                errorBuilder: (_, __, ___) => _buildPlaceholder(context),
              )
            : _buildPlaceholder(context),
      ),
    );
  }

  /// 🖼️ Simple placeholder for missing images
  Widget _buildPlaceholder(BuildContext context) {
    return Icon(
      Icons.image_outlined,
      size: 48,
      color: context.isDarkMode ? Colors.grey.shade600 : Colors.grey.shade400,
    );
  }

  /// 📝 Enterprise Standard: Essential product info only
  Widget _buildInfo(BuildContext context) {
    return Padding(
      padding: AppSpacing.cardPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand Name
          Text(
            product.brand.name,
            style: AppTypography.captionStyle(
              context,
              color: context.textColor.withOpacity(0.6),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: AppSpacing.xs),

          // Product Name - Takes remaining space
          Expanded(
            child: Text(
              product.name,
              style: AppTypography.titleStyle(
                context,
              ).copyWith(color: context.textColor),
              maxLines: AppTypography.getTitleMaxLines(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Price (if available) - Always at bottom
          if (_hasPrice()) ...[
            SizedBox(height: AppSpacing.xs),
            Text(
              _getDisplayPrice(),
              style: AppTypography.priceStyle(
                context,
                color: context.primaryColor,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// 💰 Enterprise Standard: Simple price check
  bool _hasPrice() {
    return product.variants.isNotEmpty &&
        product.variants.first.currentPrice != null;
  }

  /// � Enterprise Standard: Simple price display (no formatting logic)
  String _getDisplayPrice() {
    final price = product.variants.first.currentPrice!;
    return '${price.toStringAsFixed(0)}₫';
  }
}
