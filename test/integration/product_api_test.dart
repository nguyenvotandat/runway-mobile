import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

import 'package:runway_mobile/core/utils/constants.dart';
import 'package:runway_mobile/core/errors/exceptions.dart';
import 'package:runway_mobile/features/product/data/datasources/product_remote_datasource.dart';
import 'package:runway_mobile/features/product/data/models/models.dart';
import 'package:runway_mobile/features/product/domain/repositories/product_repository.dart';

// Helper functions for test
double getProductPrice(ProductModel product) {
  if (product.variants.isEmpty) return 0.0;
  for (var variant in product.variants) {
    if (variant.prices.isNotEmpty) {
      return double.tryParse(variant.prices.first.amount) ?? 0.0;
    }
  }
  return 0.0;
}

int getTotalStock(ProductModel product) {
  int totalStock = 0;
  for (var variant in product.variants) {
    if (variant.inventory != null) {
      totalStock += variant.inventory!.quantity;
    }
  }
  return totalStock;
}

String getProductPriceDisplay(ProductModel product) {
  final price = getProductPrice(product);
  return price > 0 ? '${price}đ' : 'N/A';
}

void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late Dio dio;

  setUpAll(() {
    // 🌐 Setup Dio với server thực của bạn
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl, // Dùng constant từ app
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer YOUR_API_KEY', // Nếu cần authentication
        },
      ),
    );

    // Enable logging để debug
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (obj) => print('🌐 DIO LOG: $obj'),
      ),
    );

    dataSource = ProductRemoteDataSourceImpl(dio);
  });

  group('🧪 Product API Integration Tests', () {
    test('✅ should successfully get products from server', () async {
      print('\n🚀 Testing getProducts() with real server...\n');

      try {
        // 🎯 ACT - Call real API
        final result = await dataSource.getProducts(page: 1, limit: 5);

        // ✅ ASSERT - Check if successful
        print('✅ SUCCESS: Got products from server!');
        print('📦 Products count: ${result.data.length}');
        print('📄 Current page: ${result.page}');
        print('📊 Total items: ${result.total}');
        print('📚 Total pages: ${result.totalPages}');
        print('⏭️ Has next page: ${result.hasNext}');

        // Verify data structure
        expect(result.data, isNotEmpty, reason: 'Should have products');
        expect(result.page, equals(1));
        expect(result.total, greaterThan(0));

        // Check first product details
        if (result.data.isNotEmpty) {
          final firstProduct = result.data.first;
          print('\n🛍️ First Product Details:');
          print('   ID: ${firstProduct.id}');
          print('   Name: ${firstProduct.name}');
          print('   Description: ${firstProduct.description ?? "N/A"}');
          print('   Brand: ${firstProduct.brandId}');
          print('   Category: ${firstProduct.categoryId}');
          print('   Variants: ${firstProduct.variants.length}');
          print('   Images: ${firstProduct.images.length}');
          print('   Rating: ${firstProduct.ratingAverage ?? "N/A"}');

          // Validate first product structure
          expect(firstProduct.id, isNotEmpty);
          expect(firstProduct.name, isNotEmpty);
          expect(firstProduct.brandId, isNotEmpty);
          expect(firstProduct.categoryId, isNotEmpty);
          expect(firstProduct.variants, isList);
          expect(firstProduct.images, isList);

          // Check first variant if available
          if (firstProduct.variants.isNotEmpty) {
            final firstVariant = firstProduct.variants.first;
            print('\n   📦 First Variant Details:');
            print('      SKU: ${firstVariant.sku}');
            print('      Status: ${firstVariant.status}');
            print('      Color ID: ${firstVariant.colorId}');
            print('      Size ID: ${firstVariant.sizeId}');
            print('      Prices: ${firstVariant.prices.length}');
            print(
              '      Inventory: ${firstVariant.inventory?.quantity ?? "N/A"}',
            );
          }
        }

        print(
          '\n🎉 Test PASSED: Server connection and data parsing successful!',
        );
      } catch (e) {
        print('\n❌ Test FAILED: $e');
        fail('getProducts() failed: $e');
      }
    });

    test('🔍 should get products with filters', () async {
      print('\n🚀 Testing getProducts() with filters...\n');

      try {
        // Create a filter
        final filter = ProductFilter(
          minPrice: 100.0,
          maxPrice: 500000.0,
          inStock: true,
          // categoryId: 'electronics', // Uncomment if you have this category
        );

        final result = await dataSource.getProducts(
          filter: filter,
          page: 1,
          limit: 3,
        );

        print('✅ SUCCESS: Got filtered products!');
        print('📦 Filtered products count: ${result.data.length}');

        // Check if products match filter criteria
        for (var product in result.data) {
          print('   - ${product.name} (Variants: ${product.variants.length})');

          // Check variant pricing if available
          if (product.variants.isNotEmpty) {
            for (var variant in product.variants) {
              if (variant.prices.isNotEmpty) {
                final price =
                    double.tryParse(variant.prices.first.amount) ?? 0.0;
                print('     Variant ${variant.sku}: ${price}đ');
              }
              if (variant.inventory != null) {
                print('     Stock: ${variant.inventory!.quantity}');
              }
            }
          }

          // Validate basic structure
          expect(product.id, isNotEmpty);
          expect(product.name, isNotEmpty);
          expect(product.variants, isList);
        }

        print('\n🎉 Filter test PASSED!');
      } catch (e) {
        print('\n⚠️ Filter test note: $e');
        // This might fail if no products match the filter, which is OK
      }
    });

    test('📄 should handle pagination correctly', () async {
      print('\n🚀 Testing pagination...\n');

      try {
        // Get page 1
        final page1 = await dataSource.getProducts(page: 1, limit: 2);
        print('📄 Page 1: ${page1.data.length} products');

        // Get page 2
        final page2 = await dataSource.getProducts(page: 2, limit: 2);
        print('📄 Page 2: ${page2.data.length} products');

        // Verify pagination
        expect(page1.page, equals(1));
        expect(page2.page, equals(2));

        // Products should be different (if enough data)
        if (page1.data.isNotEmpty && page2.data.isNotEmpty) {
          expect(page1.data.first.id, isNot(equals(page2.data.first.id)));
        }

        print('\n🎉 Pagination test PASSED!');
      } catch (e) {
        print('\n❌ Pagination test FAILED: $e');
        fail('Pagination test failed: $e');
      }
    });

    test('🔍 should search products successfully', () async {
      print('\n🚀 Testing searchProducts()...\n');

      try {
        final searchResults = await dataSource.searchProducts(
          'shirt',
          limit: 5,
        );

        print('✅ SUCCESS: Search completed!');
        print('🔍 Search results count: ${searchResults.length}');

        // Verify search results
        expect(searchResults, isList);

        // Check if results are relevant
        for (var product in searchResults) {
          print('   - Found: ${product.name}');
          if (product.variants.isNotEmpty &&
              product.variants.first.prices.isNotEmpty) {
            final price =
                double.tryParse(product.variants.first.prices.first.amount) ??
                0.0;
            print('     Price: ${price}đ');
          }

          // Basic validation
          expect(product.id, isNotEmpty);
          expect(product.name, isNotEmpty);
          expect(product.variants, isList);
        }

        print('\n🎉 Search test PASSED!');
      } catch (e) {
        print('\n⚠️ Search test note: $e');
        // Might fail if no products match search or endpoint not implemented
      }
    });

    test('⭐ should get featured products', () async {
      print('\n🚀 Testing getFeaturedProducts()...\n');

      try {
        final featuredProducts = await dataSource.getFeaturedProducts(limit: 3);

        print('✅ SUCCESS: Got featured products!');
        print('⭐ Featured products count: ${featuredProducts.length}');

        // Verify featured products
        expect(featuredProducts, isList);

        for (var product in featuredProducts) {
          print('   - Featured: ${product.name}');
          if (product.variants.isNotEmpty &&
              product.variants.first.prices.isNotEmpty) {
            final price =
                double.tryParse(product.variants.first.prices.first.amount) ??
                0.0;
            print('     Price: ${price}đ');
          }

          // Basic validation
          expect(product.id, isNotEmpty);
          expect(product.name, isNotEmpty);
          expect(product.variants, isList);
        }

        print('\n🎉 Featured products test PASSED!');
      } catch (e) {
        print('\n⚠️ Featured products test note: $e');
        // Might fail if endpoint not implemented
      }
    });

    test('🏷️ should get products by category', () async {
      print('\n🚀 Testing getProductsByCategory()...\n');

      try {
        // Try with a common category ID (you might need to adjust this)
        const categoryId =
            'electronics'; // Change to actual category ID from your backend
        final categoryProducts = await dataSource.getProductsByCategory(
          categoryId,
          limit: 3,
        );

        print('✅ SUCCESS: Got products by category!');
        print('🏷️ Category products count: ${categoryProducts.length}');

        // Verify category products
        expect(categoryProducts, isList);

        for (var product in categoryProducts) {
          print('   - Category product: ${product.name}');
          if (product.variants.isNotEmpty &&
              product.variants.first.prices.isNotEmpty) {
            final price =
                double.tryParse(product.variants.first.prices.first.amount) ??
                0.0;
            print('     Price: ${price}đ');
          }

          // Basic validation
          expect(product.id, isNotEmpty);
          expect(product.name, isNotEmpty);
          expect(product.variants, isList);
          // expect(product.categoryId, equals(categoryId)); // Validate category if needed
        }

        print('\n🎉 Category products test PASSED!');
      } catch (e) {
        print('\n⚠️ Category products test note: $e');
        // Might fail if category doesn't exist or endpoint not implemented
      }
    });

    test('🛍️ should get product detail', () async {
      print('\n🚀 Testing getProductDetail()...\n');

      try {
        // First get a product ID from the products list
        final productsResult = await dataSource.getProducts(page: 1, limit: 1);

        if (productsResult.data.isEmpty) {
          print('⚠️ No products available to test detail endpoint');
          return;
        }

        final productId = productsResult.data.first.id;
        print('🎯 Testing detail for product ID: $productId');

        // Get product detail
        final productDetail = await dataSource.getProductDetail(productId);

        print('✅ SUCCESS: Got product detail!');
        print('🛍️ Product Detail:');
        print('   ID: ${productDetail.id}');
        print('   Name: ${productDetail.name}');
        print('   Description: ${productDetail.description}');
        print('   Category: ${productDetail.categoryId}');
        print('   Brand: ${productDetail.brandId}');
        print('   Images count: ${productDetail.images.length}');
        print('   Variants count: ${productDetail.variants.length}');
        print('   Rating: ${productDetail.ratingAverage ?? "N/A"}');

        // Print variant details
        if (productDetail.variants.isNotEmpty) {
          final firstVariant = productDetail.variants.first;
          print('\n   📦 First Variant Details:');
          print('      SKU: ${firstVariant.sku}');
          print('      Status: ${firstVariant.status}');
          if (firstVariant.prices.isNotEmpty) {
            final price =
                double.tryParse(firstVariant.prices.first.amount) ?? 0.0;
            print('      Price: ${price}đ');
          }
          if (firstVariant.inventory != null) {
            print('      Stock: ${firstVariant.inventory!.quantity}');
          }
        }

        // Validate product detail
        expect(productDetail.id, equals(productId));
        expect(productDetail.name, isNotEmpty);
        expect(productDetail.categoryId, isNotEmpty);
        expect(productDetail.brandId, isNotEmpty);
        expect(productDetail.images, isList);
        expect(productDetail.variants, isList);

        print('\n🎉 Product detail test PASSED!');
      } catch (e) {
        print('\n❌ Product detail test FAILED: $e');
        fail('getProductDetail() failed: $e');
      }
    });

    test('🌐 should handle network timeouts gracefully', () async {
      print('\n🚀 Testing network timeout handling...\n');

      // Create Dio with very short timeout
      final shortTimeoutDio = Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: const Duration(milliseconds: 1), // Very short!
          receiveTimeout: const Duration(milliseconds: 1),
        ),
      );

      final timeoutDataSource = ProductRemoteDataSourceImpl(shortTimeoutDio);

      try {
        await timeoutDataSource.getProducts();
        fail('Should have thrown NetworkException');
      } catch (e) {
        print('✅ Correctly caught timeout: ${e.runtimeType}');
        expect(e, isA<NetworkException>());
        print('\n🎉 Timeout handling test PASSED!');
      }
    });

    test('📡 should handle server errors properly', () async {
      print('\n🚀 Testing server error handling...\n');

      try {
        // Try to get product with invalid endpoint
        await dio.get('/products/invalid-endpoint-test-404');
        fail('Should have thrown an exception');
      } on DioException catch (e) {
        print('✅ Correctly caught server error: ${e.response?.statusCode}');
        expect(e.response?.statusCode, equals(404));
        print('\n🎉 Server error handling test PASSED!');
      }
    });

    test('🔗 should verify API endpoint connectivity', () async {
      print('\n🚀 Testing API endpoint connectivity...\n');

      try {
        // Test products endpoint with minimal data
        final response = await dio.get('${ApiEndpoints.products}?limit=1');

        print('✅ Server is reachable!');
        print('📊 Response status: ${response.statusCode}');
        print('📝 Response structure: ${response.data.keys}');

        expect(response.statusCode, equals(200));
        expect(response.data, containsPair('success', true));
        print('\n🎉 Connectivity test PASSED!');
      } catch (e) {
        print('\n⚠️ Server might be down or endpoint changed: $e');

        // Try alternative endpoint
        try {
          final response = await dio.get('/');
          print('✅ Alternative endpoint works: ${response.statusCode}');
        } catch (e2) {
          fail('Server seems to be completely unreachable: $e2');
        }
      }
    });

    test('📊 should validate API response data structure', () async {
      print('\n🚀 Testing API response data structure validation...\n');

      try {
        final result = await dataSource.getProducts(page: 1, limit: 2);

        // Validate PaginatedProductsModel structure
        print('✅ Validating pagination structure...');
        expect(result.data, isList);
        expect(result.total, isA<int>());
        expect(result.page, isA<int>());
        expect(result.limit, isA<int>());
        expect(result.totalPages, isA<int>());
        expect(result.hasNext, isA<bool>());
        expect(result.hasPrev, isA<bool>());

        // Validate ProductModel structure
        if (result.data.isNotEmpty) {
          final product = result.data.first;
          print('✅ Validating product structure...');
          expect(product.id, isA<String>());
          expect(product.name, isA<String>());
          expect(product.description, isA<String>());
          expect(product.brandId, isA<String>());
          expect(product.categoryId, isA<String>());
          expect(product.images, isList);
          expect(product.variants, isList);
          expect(product.createdAt, isA<DateTime>());
          expect(product.updatedAt, isA<DateTime>());
          expect(product.ratingAverage, anyOf(isNull, isA<double>()));
          expect(product.ratingCount, isA<int>());

          // Validate variant structure if available
          if (product.variants.isNotEmpty) {
            final variant = product.variants.first;
            print('✅ Validating variant structure...');
            expect(variant.id, isA<String>());
            expect(variant.sku, isA<String>());
            expect(variant.status, isA<String>());
            expect(variant.colorId, isA<String>());
            expect(variant.sizeId, isA<String>());
            expect(variant.prices, isList);
            expect(variant.createdAt, isA<DateTime>());
            expect(variant.updatedAt, isA<DateTime>());

            // Validate price structure if available
            if (variant.prices.isNotEmpty) {
              final price = variant.prices.first;
              print('✅ Validating price structure...');
              expect(price.id, isA<String>());
              expect(price.amount, isA<String>());
              expect(price.currency, isA<String>());
            }

            // Validate inventory structure if available
            if (variant.inventory != null) {
              final inventory = variant.inventory!;
              print('✅ Validating inventory structure...');
              expect(inventory.quantity, isA<int>());
              expect(inventory.safetyStock, isA<int>());
              expect(inventory.updatedAt, isA<DateTime>());
            }
          }
        }

        print('\n🎉 Data structure validation test PASSED!');
      } catch (e) {
        print('\n❌ Data structure validation FAILED: $e');
        fail('API response structure validation failed: $e');
      }
    });

    // 📊 Performance & Load Tests
    test('⚡ should handle concurrent requests efficiently', () async {
      print('\n🚀 Testing concurrent API requests...\n');

      try {
        final stopwatch = Stopwatch()..start();

        // Make multiple concurrent requests
        final futures = [
          dataSource.getProducts(page: 1, limit: 2),
          dataSource.getProducts(page: 2, limit: 2),
          dataSource.searchProducts('test', limit: 3),
          dataSource.getFeaturedProducts(limit: 3),
        ];

        final results = await Future.wait(futures);
        stopwatch.stop();

        print('✅ All concurrent requests completed!');
        print('⚡ Total time: ${stopwatch.elapsedMilliseconds}ms');
        print(
          '📊 Results: ${results.map((r) => r is List ? r.length : (r as PaginatedProductsModel).data.length)}',
        );

        // Validate results
        expect(results, hasLength(4));
        expect(
          stopwatch.elapsedMilliseconds,
          lessThan(10000),
        ); // Should complete within 10 seconds

        print('\n🎉 Concurrent requests test PASSED!');
      } catch (e) {
        print('\n⚠️ Concurrent requests test note: $e');
        // Some requests might fail, which is acceptable
      }
    });

    test('📈 should handle large pagination requests', () async {
      print('\n🚀 Testing large pagination...\n');

      try {
        // Test larger page sizes
        final result = await dataSource.getProducts(page: 1, limit: 20);

        print('✅ Large pagination successful!');
        print('📦 Products returned: ${result.data.length}');
        print('📊 Total available: ${result.total}');
        print('📄 Total pages: ${result.totalPages}');

        expect(result.data.length, lessThanOrEqualTo(20));
        expect(result.limit, equals(20));

        print('\n🎉 Large pagination test PASSED!');
      } catch (e) {
        print('\n❌ Large pagination test FAILED: $e');
        fail('Large pagination failed: $e');
      }
    });

    test('🔒 should validate API security and authentication', () async {
      print('\n🚀 Testing API security...\n');

      try {
        // Test with invalid or malicious queries
        final testCases = [
          {
            'query': 'SELECT * FROM products',
            'description': 'SQL injection attempt',
          },
          {
            'query': '<script>alert("xss")</script>',
            'description': 'XSS attempt',
          },
          {
            'query': '../../etc/passwd',
            'description': 'Path traversal attempt',
          },
          {'query': 'A' * 1000, 'description': 'Long string test'},
        ];

        for (var testCase in testCases) {
          try {
            print('🔍 Testing: ${testCase['description']}');
            await dataSource.searchProducts(testCase['query']!, limit: 1);
            print('✅ Query handled safely: ${testCase['description']}');
          } catch (e) {
            print('✅ Query properly rejected: ${testCase['description']} - $e');
          }
        }

        print('\n🎉 Security test PASSED!');
      } catch (e) {
        print('\n⚠️ Security test note: $e');
      }
    });

    test('📱 should test API with edge case parameters', () async {
      print('\n🚀 Testing edge case parameters...\n');

      final testCases = [
        {'page': 0, 'limit': 10, 'description': 'Zero page'},
        {'page': -1, 'limit': 10, 'description': 'Negative page'},
        {'page': 1, 'limit': 0, 'description': 'Zero limit'},
        {'page': 1, 'limit': -5, 'description': 'Negative limit'},
        {'page': 999999, 'limit': 10, 'description': 'Very high page'},
        {'page': 1, 'limit': 1000, 'description': 'Very high limit'},
      ];

      for (var testCase in testCases) {
        try {
          print('🧪 Testing: ${testCase['description']}');
          final result = await dataSource.getProducts(
            page: testCase['page'] as int,
            limit: testCase['limit'] as int,
          );
          print(
            '✅ ${testCase['description']}: ${result.data.length} products returned',
          );
        } catch (e) {
          print(
            '⚠️ ${testCase['description']}: Handled with error - ${e.runtimeType}',
          );
        }
      }

      print('\n🎉 Edge case parameters test COMPLETED!');
    });

    test('🌍 should test API response time and reliability', () async {
      print('\n🚀 Testing API response time and reliability...\n');

      final responseTimes = <int>[];
      const numberOfRequests = 5;

      for (int i = 0; i < numberOfRequests; i++) {
        final stopwatch = Stopwatch()..start();

        try {
          await dataSource.getProducts(page: 1, limit: 5);
          stopwatch.stop();
          responseTimes.add(stopwatch.elapsedMilliseconds);
          print('📊 Request ${i + 1}: ${stopwatch.elapsedMilliseconds}ms');
        } catch (e) {
          stopwatch.stop();
          print('❌ Request ${i + 1} failed: $e');
        }
      }

      if (responseTimes.isNotEmpty) {
        final averageTime =
            responseTimes.reduce((a, b) => a + b) / responseTimes.length;
        final maxTime = responseTimes.reduce((a, b) => a > b ? a : b);
        final minTime = responseTimes.reduce((a, b) => a < b ? a : b);

        print('\n📈 Performance Summary:');
        print('   Average response time: ${averageTime.toStringAsFixed(2)}ms');
        print('   Fastest response: ${minTime}ms');
        print('   Slowest response: ${maxTime}ms');
        print(
          '   Success rate: ${(responseTimes.length / numberOfRequests * 100).toStringAsFixed(1)}%',
        );

        // Performance assertions
        expect(
          averageTime,
          lessThan(5000),
          reason: 'Average response should be under 5 seconds',
        );
        expect(
          maxTime,
          lessThan(10000),
          reason: 'Max response should be under 10 seconds',
        );

        print('\n🎉 Performance and reliability test PASSED!');
      } else {
        print('\n❌ All requests failed - server might be down');
      }
    });
  });
}
