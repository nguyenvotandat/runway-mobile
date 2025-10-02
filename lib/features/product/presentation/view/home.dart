import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runway_mobile/core/di/injection.dart';
import 'package:runway_mobile/features/catalog/application/bloc/catalog_bloc.dart';
import 'package:runway_mobile/features/product/application/bloc/product_bloc.dart';
import 'package:runway_mobile/features/product/presentation/widgets/header.dart';
import 'package:runway_mobile/features/product/presentation/widgets/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusBarColor = Theme.of(context).colorScheme.secondary;
    final isLightColor = statusBarColor.computeLuminance() > 0.5;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors
            .transparent, // ✅ Make transparent để widget color show through
        statusBarIconBrightness: isLightColor
            ? Brightness.dark
            : Brightness.light,
        statusBarBrightness: isLightColor ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: statusBarColor, // ✅ Set scaffold background
        body: Container(
          color: statusBarColor, // ✅ Extend color to full screen
          child: SafeArea(
            top: false, // ✅ Don't apply SafeArea to top - let color extend
            child: Column(
              children: [
                // ✅ Status bar area với secondary color
                Container(
                  height: MediaQuery.of(context).padding.top,
                  color: statusBarColor,
                  width: double.infinity,
                ),
                // ✅ Content area
                Expanded(
                  child: Container(
                    color: Theme.of(
                      context,
                    ).scaffoldBackgroundColor, // ✅ Normal background cho content
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => getIt<ProductBloc>()
                            ..add(const ProductEvent.getProductsRequested()),
                        ),
                        BlocProvider(
                          create: (context) => getIt<CatalogBloc>()
                            ..add(const CatalogEvent.getCategoriesRequested()),
                        ),
                      ],
                      child: const Column(
                        children: [
                          Header(),
                          Expanded(child: Products()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
