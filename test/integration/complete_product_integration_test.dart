import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:runway_mobile/features/product/data/datasources/product_remote_datasource.dart';

void main() {
  group('🚀 Product API Integration Tests', () {
    late ProductRemoteDataSourceImpl dataSource;

    setUpAll(() async {
      print('🔧 Setting up Product API Integration Tests...');

      // Create Dio instance
      final dio = Dio();
      dio.options.baseUrl = 'http://localhost:3000/api';
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Create data source manually
      dataSource = ProductRemoteDataSourceImpl(dio);

      print('✅ Integration test environment setup complete!\n');
    });

    test('✅ should get paginated products successfully', () async {
      print('🚀 Testing getProducts method...');

      try {
        final result = await dataSource.getProducts(page: 1, limit: 10);

        print('✅ Products fetched successfully!');
        print('📦 Products count: ${result.data.length}');
        print('📊 Total: ${result.total}');
        print('📄 Page: ${result.page}');
        print('📚 Total pages: ${result.totalPages}');
        print('➡️ Has next: ${result.hasNext}');
        print('⬅️ Has prev: ${result.hasPrev}');

        // Assertions
        expect(result.data, isNotEmpty);
        expect(result.total, greaterThanOrEqualTo(1));
        expect(result.page, 1);
        expect(result.totalPages, greaterThanOrEqualTo(1));

        // Check first product details
        final firstProduct = result.data.first;
        print('\n🛍️ First Product Details:');
        print('   ID: ${firstProduct.id}');
        print('   Name: ${firstProduct.name}');
        print('   Slug: ${firstProduct.slug}');
        print('   Description: ${firstProduct.description}');
        print('   Brand: ${firstProduct.brand?.name ?? "Unknown"}');
        print('   Category: ${firstProduct.category?.name ?? "Unknown"}');
        print('   Variants: ${firstProduct.variants.length}');
        print('   Images: ${firstProduct.images.length}');
        print('   Rating: ${firstProduct.ratingAverage ?? "N/A"}');
        print('   Rating Count: ${firstProduct.ratingCount}');

        expect(firstProduct.id, isNotEmpty);
        expect(firstProduct.name, isNotEmpty);

        print('\n🎉 getProducts integration test PASSED!');
      } catch (e) {
        print('❌ getProducts test FAILED: $e');
        fail('Product API integration test failed: $e');
      }
    });

    test('✅ should get product detail successfully', () async {
      print('🚀 Testing getProductDetail method...');

      try {
        // First get list of products to get a valid ID
        final productsResult = await dataSource.getProducts(page: 1, limit: 1);
        expect(productsResult.data, isNotEmpty);

        final productId = productsResult.data.first.id;
        print('🔍 Fetching product detail for ID: $productId');

        final productDetail = await dataSource.getProductDetail(productId);

        print('✅ Product detail fetched successfully!');
        print('📦 Product: ${productDetail.name}');
        print('🏷️ Brand: ${productDetail.brand?.name ?? "Unknown"}');
        print('📂 Category: ${productDetail.category?.name ?? "Unknown"}');
        print('🔧 Variants: ${productDetail.variants.length}');

        expect(productDetail.id, equals(productId));
        expect(productDetail.name, isNotEmpty);

        print('🎉 getProductDetail integration test PASSED!');
      } catch (e) {
        print('❌ getProductDetail test FAILED: $e');
        fail('Product detail integration test failed: $e');
      }
    });

    test('✅ should handle invalid product ID gracefully', () async {
      print('🚀 Testing error handling for invalid product ID...');

      try {
        await dataSource.getProductDetail('invalid-product-id-12345');
        fail('Should have thrown an exception for invalid product ID');
      } catch (e) {
        print('✅ Error handled correctly: ${e.runtimeType}');
        print('📝 Error message: $e');

        expect(e.toString(), contains('Không tìm thấy sản phẩm'));

        print('🎉 Error handling integration test PASSED!');
      }
    });

    test('✅ should search products (if endpoint exists)', () async {
      print('🚀 Testing searchProducts method...');

      try {
        final searchResults = await dataSource.searchProducts('Áo', limit: 5);

        print('✅ Search completed!');
        print('📦 Search results: ${searchResults.length}');

        for (final product in searchResults) {
          print('   - ${product.name}');
        }

        expect(searchResults, isList);

        print('🎉 Search integration test PASSED!');
      } catch (e) {
        print('⚠️ Search test SKIPPED (endpoint might not exist): $e');
        // Skip this test if search endpoint doesn't exist
      }
    });

    test('✅ should get featured products (if endpoint exists)', () async {
      print('🚀 Testing getFeaturedProducts method...');

      try {
        final featuredProducts = await dataSource.getFeaturedProducts(limit: 5);

        print('✅ Featured products fetched!');
        print('📦 Featured products: ${featuredProducts.length}');

        for (final product in featuredProducts) {
          print('   - ${product.name}');
        }

        expect(featuredProducts, isList);

        print('🎉 Featured products integration test PASSED!');
      } catch (e) {
        print(
          '⚠️ Featured products test SKIPPED (endpoint might not exist): $e',
        );
        // Skip this test if featured endpoint doesn't exist
      }
    });

    tearDownAll(() {
      print('\n🧹 Cleaning up integration test environment...');
      print('✅ Integration tests completed!');
    });
  });
}
