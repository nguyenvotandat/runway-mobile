class AppConstants {
  static const String appName = 'Runway Fashion';
  static const String baseUrl = 'http://localhost:3000/api';

  // Storage keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';

  // Validation
  static const int minPasswordLength = 6;
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  // UI
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;

  // 3D Model
  static const String defaultGlbPath = 'assets/models/default.glb';

  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 600);
}

class ApiEndpoints {
  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // Products
  static const String products = '/products';
  static const String productDetail = '/products';

  // Categories
  static const String categories = '/categories';

  // Orders
  static const String orders = '/orders';

  // User
  static const String profile = '/user/profile';
}
