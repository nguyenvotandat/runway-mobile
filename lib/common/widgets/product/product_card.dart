import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../features/product/domain/entities/product_entity.dart';
import '../../../core/utils/extensions.dart';
class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => _onProductTapped(context),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: product.images.isNotEmpty
                            ? product.images.first.url
                            : '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child: Icon(Icons.image, color: Colors.grey[400]),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Favorite Button
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => _onFavoritePressed(context),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons
                              .favorite_border, // TODO: Implement favorite functionality
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                    ),
                  ),

                  // TODO: Implement discount badge when needed
                ],
              ),
            ),

            // Product Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 4),

                    // Rating & Reviews
                    if (product.ratingAverage != null &&
                        product.ratingAverage! > 0)
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 12),
                          SizedBox(width: 2),
                          Text(
                            product.ratingAverage!.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '(${product.ratingCount})',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),

                    SizedBox(height: 4),

                    // Price & Add to Cart
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getDisplayPrice(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Add to Cart Button
                        GestureDetector(
                          onTap: () => _onAddToCartPressed(context),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onProductTapped(BuildContext context) {
    // Navigate to product detail
    Navigator.pushNamed(context, '/product-detail', arguments: product.id);
  }

  void _onFavoritePressed(BuildContext context) {
    // TODO: Implement favorite functionality
    // context.read<ProductListBloc>().add(
    //   ToggleProductFavorite(product.id),
    // );

    context.showSnackBar('Tính năng yêu thích đang phát triển');
  }

  String _getDisplayPrice() {
    if (product.variants.isNotEmpty) {
      // Get available prices from variants
      final prices = product.variants
          .map((v) => v.currentPrice)
          .where((price) => price != null)
          .cast<double>()
          .toList();

      if (prices.isNotEmpty) {
        final minPrice = prices.reduce((a, b) => a < b ? a : b);
        return '${minPrice.toStringAsFixed(0)}₫';
      }
    }
    return 'Liên hệ để biết giá';
  }

  void _onAddToCartPressed(BuildContext context) {
    // Option 1: Emit event to CartBloc
    // context.read<CartBloc>().add(AddToCart(product.id));

    // Option 2: Call UseCase directly
    // getIt<AddToCartUseCase>().call(productId: product.id);

    context.showSnackBar('Đã thêm vào giỏ hàng');
  }
}
