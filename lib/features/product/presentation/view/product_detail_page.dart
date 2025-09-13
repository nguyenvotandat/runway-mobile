import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/utils/extensions.dart';
import '../../application/bloc/product_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProductBloc>()
            ..add(ProductEvent.getProductDetailRequested(productId)),
      child: Scaffold(
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) {
                context.showSnackBar(message, isError: true);
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loadingDetail: () =>
                  const Center(child: CircularProgressIndicator()),
              loadingMore: (_) =>
                  const Center(child: CircularProgressIndicator()),
              loaded: (_) => const Center(child: CircularProgressIndicator()),
              detailLoaded: (product) => _buildProductDetail(context, product),
              error: (message) => _buildErrorState(context, message),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductDetail(BuildContext context, product) {
    return CustomScrollView(
      slivers: [
        // App bar with image
        SliverAppBar(
          expandedHeight: 400,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: product.images.isNotEmpty
                ? PageView.builder(
                    itemCount: product.images.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: product.images[index].url,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 50,
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.image,
                      color: Colors.grey,
                      size: 50,
                    ),
                  ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // TODO: Add to favorites
              },
            ),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // TODO: Share product
              },
            ),
          ],
        ),

        // Product details
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product name and brand
                Text(product.name, style: context.textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(
                  product.brand,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),

                // Price
                Text(
                  product.price.formatCurrency,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // Colors
                if (product.colors.isNotEmpty) ...[
                  Text('Màu sắc', style: context.textTheme.titleLarge),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    children: product.colors.map((color) {
                      return Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(
                            int.parse(color.hex.replaceFirst('#', '0xFF')),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Tooltip(
                          message: color.name,
                          child: const SizedBox(),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                ],

                // 3D Model viewer
                if (product.glbUrl != null) ...[
                  Text('Xem 3D', style: context.textTheme.titleLarge),
                  const SizedBox(height: 12),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: ModelViewer(
                        src: product.glbUrl!,
                        alt: 'Mô hình 3D của ${product.name}',
                        autoRotate: true,
                        cameraControls: true,
                        backgroundColor: const Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // Description (placeholder)
                Text('Mô tả sản phẩm', style: context.textTheme.titleLarge),
                const SizedBox(height: 12),
                Text(
                  'Đây là một sản phẩm thời trang chất lượng cao từ thương hiệu ${product.brand}. '
                  'Sản phẩm được thiết kế với chất liệu cao cấp và kiểu dáng hiện đại, '
                  'phù hợp cho nhiều dịp khác nhau.',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),

                // Add to cart button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add to cart
                      context.showSnackBar('Đã thêm vào giỏ hàng');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Thêm vào giỏ hàng'),
                  ),
                ),
                const SizedBox(height: 16),

                // Buy now button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Buy now
                      context.showSnackBar('Tính năng đang được phát triển');
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Mua ngay'),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('Có lỗi xảy ra', style: context.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            message,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Quay lại'),
          ),
        ],
      ),
    );
  }
}
