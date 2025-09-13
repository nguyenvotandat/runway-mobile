import 'package:flutter_test/flutter_test.dart';
import 'product_api_test.dart' as product_api_tests;

/// 🚀 Integration Test Runner for Runway Mobile API
///
/// This runner helps organize and execute all integration tests systematically
/// Run this to test your API endpoints before deploying to production
void main() {
  group('🧪 RUNWAY MOBILE API INTEGRATION TESTS', () {
    print('\n' + '=' * 80);
    print('🚀 STARTING RUNWAY MOBILE API INTEGRATION TESTS');
    print('=' * 80);
    print('📅 Test Run: ${DateTime.now()}');
    print('🎯 Target: Product API Endpoints');
    print('📍 Base URL: Check constants.dart for current configuration');
    print('=' * 80 + '\n');

    setUpAll(() {
      print('🔧 Setting up integration test environment...\n');
    });

    tearDownAll(() {
      print('\n' + '=' * 80);
      print('✅ INTEGRATION TESTS COMPLETED');
      print('📊 Check results above for any failures or warnings');
      print('🔍 Review logs for detailed API response information');
      print('=' * 80 + '\n');
    });

    // Run Product API tests
    group('📦 PRODUCT API TESTS', product_api_tests.main);
  });
}
