import 'package:flutter/material.dart';
import '../../../features/product/domain/entities/product_entity.dart';
import '../../../core/design_system/screen_sizes.dart';
import '../../../core/design_system/app_spacing.dart';
import 'responsive_product_card.dart';

class ResponsiveProductGrid extends StatelessWidget {
  final List<ProductEntity> products;
  final ScrollController? scrollController;
  final VoidCallback? onLoadMore;

  const ResponsiveProductGrid({
    super.key,
    required this.products,
    this.scrollController,
    this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = ScreenSizes.getGridColumns(context);
        final spacing = AppSpacing.gridSpacing(context);

        // Calculate optimal item dimensions
        final availableWidth =
            constraints.maxWidth - AppSpacing.screenMargin(context).horizontal;
        final itemWidth =
            (availableWidth - (spacing * (columns - 1))) / columns;
        final aspectRatio = ScreenSizes.getCardAspectRatio(context);

        return Padding(
          padding: AppSpacing.screenMargin(context),
          child: GridView.builder(
            controller: scrollController,

            // Use SliverGridDelegateWithMaxCrossAxisExtent for better responsiveness
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: itemWidth + spacing,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
            ),

            // Performance optimizations
            physics: const BouncingScrollPhysics(),
            cacheExtent: (itemWidth / aspectRatio) * 2, // Cache 2 rows ahead

            itemCount: products.length,
            itemBuilder: (context, index) {
              // Load more trigger
              if (index == products.length - 1 && onLoadMore != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  onLoadMore!();
                });
              }

              return ResponsiveProductCard(
                product: products[index],
                onTap: () => _navigateToDetail(context, products[index].id),
              );
            },
          ),
        );
      },
    );
  }

  void _navigateToDetail(BuildContext context, String productId) {
    Navigator.pushNamed(context, '/product-detail', arguments: productId);
  }
}
