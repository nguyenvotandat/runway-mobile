import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

import 'package:runway_mobile/core/utils/constants.dart';
import 'package:runway_mobile/core/errors/exceptions.dart';
import 'package:runway_mobile/features/product/data/datasources/product_remote_datasource.dart';

void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late Dio dio;

  setUpAll(() {
    print('\n🔧 Setting up API Test Environment...\n');

    // 🌐 Setup Dio cho testing
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

    // Enable logging để debug
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        error: true,
        logPrint: (obj) => print('API: $obj'),
      ),
    );

    dataSource = ProductRemoteDataSourceImpl(dio);
    print('✅ Test environment setup complete!\n');
  });

  group('🧪 Basic Product API Tests', () {
    test('✅ should connect to API and get products', () async {
      print('🚀 Testing basic API connectivity...\n');

      try {
        // Test basic getProducts call (no parameters)
        final result = await dataSource.getProducts();

        print('✅ API call successful!');
        print('📦 Products returned: ${result.data.length}');
        print('📊 Total available: ${result.total}');
        print('📄 Current page: ${result.page}');
        print('📚 Total pages: ${result.totalPages}');

        // Basic validations
        expect(result.data, isList);
        expect(result.total, isA<int>());
        expect(result.page, equals(1));

        // Check first product if available
        if (result.data.isNotEmpty) {
          final product = result.data.first;
          print('\n🛍️ Sample Product:');
          print('   ID: ${product.id}');
          print('   Name: ${product.name}');
          print('   Brand ID: ${product.brandId}');
          print('   Category ID: ${product.categoryId}');
          print('   Variants: ${product.variants.length}');
          print('   Images: ${product.images.length}');

          expect(product.id, isNotEmpty);
          expect(product.name, isNotEmpty);
        }

        print('\n🎉 Basic API test PASSED!\n');
      } catch (e) {
        print('\n❌ Basic API test FAILED: $e\n');
        fail('API connectivity test failed: $e');
      }
    });

    test('🔍 should handle API errors gracefully', () async {
      print('🚀 Testing API error handling...\n');

      try {
        // Test with invalid product ID
        await dataSource.getProductDetail('invalid-product-id-12345');
        fail('Should have thrown an exception for invalid ID');
      } catch (e) {
        print('✅ Error handled correctly: ${e.runtimeType}');
        print('📝 Error message: $e');

        expect(e, isA<ServerException>());
        print('\n🎉 Error handling test PASSED!\n');
      }
    });

    test('🌐 should verify server connectivity', () async {
      print('🚀 Testing server connectivity...\n');

      try {
        // Simple GET request to base endpoint
        final response = await dio.get('/products');

        print('✅ Server is reachable!');
        print('📊 Status: ${response.statusCode}');
        print('📈 Success: ${response.data['success']}');
        print('💬 Message: ${response.data['message']}');

        expect(response.statusCode, equals(200));
        expect(response.data['success'], isTrue);

        print('\n🎉 Connectivity test PASSED!\n');
      } catch (e) {
        print('\n❌ Server connectivity test FAILED: $e\n');
        fail('Server connectivity failed: $e');
      }
    });
  });
}
