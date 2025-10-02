import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runway_mobile/features/product/application/bloc/product_bloc.dart';
import 'package:runway_mobile/features/product/presentation/widgets/widgets.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // ✅ Fix: Shrink-wrap content
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Products",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // ✅ Fix: Use Flexible instead of Expanded
        Flexible(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              debugPrint("🔍 ProductState: ${state.runtimeType}");

              if (state is ProductInitial) {
                debugPrint("📱 State: Initial");
                return const SizedBox(
                  height: 200,
                  child: Center(child: Text("Data loading")),
                );
              }

              if (state is ProductLoading) {
                debugPrint("⏳ State: Loading");
                return const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is ProductLoaded) {
                debugPrint("✅ products Loaded");
                debugPrint(
                  "📦 Count: ${state.paginatedProducts.products.length}",
                );

                // ✅ Fix: Container with explicit height
                return SizedBox(
                  height:
                      MediaQuery.of(context).size.height *
                      0.7, // 70% screen height
                  child: ProductListDisplayWidget(
                    products: state.paginatedProducts.products,
                  ),
                );
              }

              if (state is ProductError) {
                debugPrint("❌ State: Error - ${state.message}");
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.red),
                        Text("Error: ${state.message}"),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ProductBloc>().add(
                              const ProductEvent.getProductsRequested(),
                            );
                          },
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  ),
                );
              }

              debugPrint("❓ State: Unknown");
              return const SizedBox(
                height: 200,
                child: Center(child: Text("Unknown state")),
              );
            },
          ),
        ),
      ],
    );
  }
}
