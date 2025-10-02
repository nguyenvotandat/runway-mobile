import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:runway_mobile/features/product/presentation/view/home.dart';
import '../../features/auth/presentation/view/login_page.dart';
import '../../features/auth/presentation/view/register_page.dart';
import '../../features/catalog/presentation/view/catalog_page.dart';
import '../../features/product/product.dart'; // Using barrel export
import '../../features/cart/presentation/view/cart_page.dart';
import '../../features/profile/presentation/view/profile_page.dart';

class AppRouter {
  // 🚧 Development routes
  static List<RouteBase> get _developmentRoutes => [
    GoRoute(
      path: '/dev-playground',
      name: 'dev-playground',
      builder: (context, state) => const HomePage(),
    ),
  ];

  // 📱 Production routes
  static List<RouteBase> get _productionRoutes => [
    // Auth routes
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterPage(),
    ),

    // Main app routes
    GoRoute(
      path: '/catalog',
      name: 'catalog',
      builder: (context, state) => const CatalogPage(),
    ),
    GoRoute(
      path: '/product/:id',
      name: 'product-detail',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        return ProductDetailPage(productId: productId);
      },
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfilePage(),
    ),
  ];

  // 🎯 Dynamic router creation based on build mode
  static GoRouter getRouter(bool isDebugMode) {
    return GoRouter(
      // 🚧 Debug: Start at playground, Production: Start at product detail
      initialLocation: isDebugMode
          ? '/dev-playground'
          : '/product/3e86e634-b913-481d-9a50-6306d509547f',
      routes: [
        // Always include production routes
        ..._productionRoutes,
        // Add development routes only in debug mode
        if (isDebugMode) ..._developmentRoutes,
      ],
      redirect: (context, state) {
        return null;
      },
    );
  }

  // 📱 Legacy getter for backward compatibility
  static GoRouter get router => getRouter(kDebugMode);
}
