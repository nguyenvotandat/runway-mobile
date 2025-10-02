import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runway_mobile/core/di/injection.dart';
import '../application/bloc/product_bloc.dart';
import 'widgets/widgets.dart';

/// 🏢 Enterprise Standard: BlocProvider.value Pattern Example
///
/// ✅ Parent creates BLoC once
/// ✅ Children share existing BLoC instance via BlocProvider.value
/// ✅ No duplicate BLoC instances
/// ✅ Clean separation of concerns
class ProductPageExample extends StatelessWidget {
  const ProductPageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // ✅ Create BLoC once at parent level
      create: (context) => getIt<ProductBloc>()
        ..add(
          const ProductEvent.getProductsRequested(
            filter: null,
            page: 1,
            limit: 10,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            // ✅ Search button uses existing BLoC
            BlocProvider.value(
              value: context.read<ProductBloc>(),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => _showSearchDialog(context),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // ✅ Filter bar shares existing BLoC
            BlocProvider.value(
              value: context.read<ProductBloc>(),
              child: const ProductFilterBar(),
            ),

            // ✅ Product list shares existing BLoC
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductInitial || state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProductError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Error: ${state.message}'),
                          ElevatedButton(
                            onPressed: () {
                              // ✅ Retry using existing BLoC
                              context.read<ProductBloc>().add(
                                const ProductEvent.getProductsRequested(
                                  filter: null,
                                  page: 1,
                                  limit: 10,
                                ),
                              );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is ProductLoaded) {
                    // ✅ ProductListDisplayWidget automatically accesses existing BLoC
                    return ProductListDisplayWidget(
                      products: state.paginatedProducts.products,
                      isGridView: true,
                      onRefresh: () {
                        // ✅ Custom refresh logic using existing BLoC
                        context.read<ProductBloc>().add(
                          const ProductEvent.getProductsRequested(
                            filter: null,
                            page: 1,
                            limit: 10,
                          ),
                        );
                      },
                      onLoadMore: () {
                        // ✅ Custom load more logic using existing BLoC
                        context.read<ProductBloc>().add(
                          const ProductEvent.getProductsRequested(
                            filter: null,
                            page: 2, // Next page (simplified)
                            limit: 10,
                          ),
                        );
                      },
                      onProductTap: (product) {
                        // ✅ Custom product tap logic using existing BLoC
                        context.read<ProductBloc>().add(
                          ProductEvent.getProductDetailRequested(product.id),
                        );
                        Navigator.pushNamed(
                          context,
                          '/product-detail',
                          arguments: product,
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),

            // ✅ Bottom actions share existing BLoC
            BlocProvider.value(
              value: context.read<ProductBloc>(),
              child: const ProductBottomActions(),
            ),
          ],
        ),
        floatingActionButton: BlocProvider.value(
          value: context.read<ProductBloc>(),
          child: FloatingActionButton(
            onPressed: () {
              // ✅ FAB uses existing BLoC for refresh
              context.read<ProductBloc>().add(
                const ProductEvent.getProductsRequested(
                  filter: null,
                  page: 1,
                  limit: 10,
                ),
              );
            },
            child: const Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        // ✅ Dialog shares existing BLoC
        value: context.read<ProductBloc>(),
        child: AlertDialog(
          title: const Text('Search Products'),
          content: TextField(
            onSubmitted: (query) {
              // ✅ Search uses existing BLoC (simplified example)
              context.read<ProductBloc>().add(
                const ProductEvent.getProductsRequested(
                  filter: null,
                  page: 1,
                  limit: 10,
                ),
              );
              Navigator.pop(dialogContext);
            },
            decoration: const InputDecoration(
              hintText: 'Enter product name...',
            ),
          ),
        ),
      ),
    );
  }
}

/// 🎯 Filter bar component that uses existing BLoC
class ProductFilterBar extends StatelessWidget {
  const ProductFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              // ✅ Uses existing BLoC via context.read<T>() (simplified)
              context.read<ProductBloc>().add(
                const ProductEvent.getProductsRequested(
                  filter: null,
                  page: 1,
                  limit: 10,
                ),
              );
            },
            child: const Text('Electronics'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              // ✅ Uses existing BLoC via context.read<T>() (simplified)
              context.read<ProductBloc>().add(
                const ProductEvent.getProductsRequested(
                  filter: null,
                  page: 1,
                  limit: 10,
                ),
              );
            },
            child: const Text('Clothing'),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              // ✅ Clear filters using existing BLoC (simplified)
              context.read<ProductBloc>().add(
                const ProductEvent.getProductsRequested(
                  filter: null,
                  page: 1,
                  limit: 10,
                ),
              );
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}

/// 🎯 Bottom actions component that uses existing BLoC
class ProductBottomActions extends StatelessWidget {
  const ProductBottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${state.paginatedProducts.products.length} products'),
                ElevatedButton(
                  onPressed: () {
                    // ✅ Sort using existing BLoC (simplified)
                    context.read<ProductBloc>().add(
                      const ProductEvent.getProductsRequested(
                        filter: null,
                        page: 1,
                        limit: 10,
                      ),
                    );
                  },
                  child: const Text('Sort by Price'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // ✅ Toggle view using existing BLoC (simplified)
                    context.read<ProductBloc>().add(
                      const ProductEvent.getProductsRequested(
                        filter: null,
                        page: 1,
                        limit: 10,
                      ),
                    );
                  },
                  child: const Text('Toggle View'),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
