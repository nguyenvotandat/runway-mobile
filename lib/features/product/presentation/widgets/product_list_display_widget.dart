import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../application/bloc/product_bloc.dart';
import '../../domain/entities/product_entity.dart';
import 'product_card.dart';

/// Enterprise Standard ProductListDisplayWidget
///
/// ✅ Single Responsibility: Display product list only
/// ✅ BlocProvider.value Pattern: Shares existing BLoC instance
/// ✅ Context-based BLoC Access: Uses context.read<T>() pattern
/// ✅ Stateful for UI State: Manages scroll, loading states
/// ✅ Design System Compliant: 100% uses design system
/// ✅ Reusable Component: Can be used anywhere with existing BLoC
class ProductListDisplayWidget extends StatefulWidget {
  final List<ProductEntity> products;
  final bool isGridView;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final void Function(ProductEntity)? onProductTap;
  const ProductListDisplayWidget({
    super.key,
    required this.products,
    this.isGridView = true,
    this.onRefresh,
    this.onLoadMore,
    this.onProductTap,
  });

  @override
  State<ProductListDisplayWidget> createState() =>
      _ProductListDisplayWidgetState();
}

class _ProductListDisplayWidgetState extends State<ProductListDisplayWidget> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  void _loadMore() {
    if (!_isLoadingMore) {
      setState(() => _isLoadingMore = true);

      // ✅ Enterprise Standard: Use callback or fallback to context.read<T>()
      if (widget.onLoadMore != null) {
        widget.onLoadMore!();
      } else {
        // ✅ Fallback: Use existing BLoC via context
        context.read<ProductBloc>().add(
          const ProductEvent.getProductsRequested(
            filter: null,
            page: 2, // Next page
            limit: 10,
          ),
        );
      }
    }
  }

  void _onRefresh() {
    // ✅ Enterprise Standard: Use callback or fallback to context.read<T>()
    if (widget.onRefresh != null) {
      widget.onRefresh!();
    } else {
      // ✅ Fallback: Use existing BLoC via context
      context.read<ProductBloc>().add(
        const ProductEvent.getProductsRequested(
          filter: null,
          page: 1,
          limit: 10,
        ),
      );
    }
  }

  void _onProductTap(ProductEntity product) {
    if (widget.onProductTap != null) {
      widget.onProductTap!(product);
    } else {
      // ✅ Default behavior: Load product detail via existing BLoC
      context.read<ProductBloc>().add(
        ProductEvent.getProductDetailRequested(product.id),
      );
      debugPrint('Tapped on product: ${product.name}');
      // TODO: Navigate to product detail page
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return _buildEmptyState(context);
    }

    return BlocListener<ProductBloc, ProductState>(
      // ✅ Listen for state changes to update loading state
      listener: (context, state) {
        if (state is ProductLoaded || state is ProductError) {
          setState(() => _isLoadingMore = false);
        }
      },
      child: RefreshIndicator(
        onRefresh: () async => _onRefresh(),
        child: widget.isGridView
            ? _buildGridView(context)
            : _buildListView(context),
      ),
    );
  }

  /// 📊 Grid view for product cards
  Widget _buildGridView(BuildContext context) {
    final columns = ScreenSizes.getGridColumns(context);

    return GridView.builder(
      controller: _scrollController,
      padding: AppSpacing.screenMargin(context),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: AppSpacing.gridSpacing(context),
        mainAxisSpacing: AppSpacing.gridSpacing(context),
        childAspectRatio: ScreenSizes.getCardAspectRatio(context),
      ),
      itemCount: widget.products.length + (_isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        // Load more indicator
        if (index == widget.products.length) {
          return _buildLoadMoreIndicator(context);
        }

        final product = widget.products[index];
        return ProductCard(
          product: product,
          isGridView: true,
          onTap: () => _onProductTap(product),
        );
      },
    );
  }

  /// 📋 List view for product cards
  Widget _buildListView(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: AppSpacing.screenMargin(context),
      itemCount: widget.products.length + (_isLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) =>
          SizedBox(height: AppSpacing.gridSpacing(context)),
      itemBuilder: (context, index) {
        // Load more indicator
        if (index == widget.products.length) {
          return _buildLoadMoreIndicator(context);
        }

        final product = widget.products[index];
        return ProductCard(
          product: product,
          isGridView: false,
          onTap: () => _onProductTap(product),
        );
      },
    );
  }

  /// 🚫 Empty state when no products
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.screenMargin(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 64,
              color: context.textColor.withOpacity(0.3),
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Không có sản phẩm nào',
              style: AppTypography.headingStyle(
                context,
                color: context.textColor.withOpacity(0.6),
              ),
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              'Thử tìm kiếm hoặc làm mới trang',
              style: AppTypography.bodyStyle(
                context,
                color: context.textColor.withOpacity(0.5),
              ),
            ),
            SizedBox(height: AppSpacing.lg),
            ElevatedButton.icon(
              onPressed: _onRefresh,
              icon: const Icon(Icons.refresh),
              label: const Text('Làm mới'),
            ),
          ],
        ),
      ),
    );
  }

  /// ⏳ Load more indicator
  Widget _buildLoadMoreIndicator(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
