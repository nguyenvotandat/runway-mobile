import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

import 'package:runway_mobile/core/utils/constants.dart';

void main() {
  late Dio dio;

  setUpAll(() {
    print('\n🔧 Setting up Raw API Test...\n');

    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    print('✅ Raw test setup complete!\n');
  });

  group('🧪 Raw API Response Tests', () {
    test('✅ should parse raw API response', () async {
      print('🚀 Testing raw API response parsing...\n');

      try {
        // Get raw response
        final response = await dio.get('/products');

        print('✅ Raw API call successful!');
        print('📊 Status: ${response.statusCode}');
        print('📈 Success: ${response.data['success']}');

        // Parse data structure step by step
        final data = response.data['data'] as Map<String, dynamic>;
        final products = data['data'] as List<dynamic>;

        print('📦 Products count: ${products.length}');

        if (products.isNotEmpty) {
          final firstProduct = products.first as Map<String, dynamic>;
          print('\n🛍️ First Product Raw Fields:');
          firstProduct.forEach((key, value) {
            print('   $key: $value (${value.runtimeType})');
          });

          // Check variants
          final variants = firstProduct['variants'] as List<dynamic>;
          print('\n🔧 Variants count: ${variants.length}');

          if (variants.isNotEmpty) {
            final firstVariant = variants.first as Map<String, dynamic>;
            print('\n🛍️ First Variant Raw Fields:');
            firstVariant.forEach((key, value) {
              print('   $key: $value (${value.runtimeType})');
            });
          }
        }

        print('\n🎉 Raw parsing test PASSED!\n');
      } catch (e, stackTrace) {
        print('\n❌ Raw parsing test FAILED: $e');
        print('Stack trace: $stackTrace\n');
        fail('Raw parsing test failed: $e');
      }
    });
  });
}
