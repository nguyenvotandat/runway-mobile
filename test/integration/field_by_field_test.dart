import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:runway_mobile/features/product/data/models/product_model.dart';

void main() {
  group('🔬 Field by Field Test', () {
    late Dio dio;

    setUpAll(() {
      print('🔧 Setting up Field by Field Test...');
      dio = Dio();
      dio.options.baseUrl = 'http://localhost:3000/api';
      print('✅ Field by Field test setup complete!\n');
    });

    test('🧪 should parse each field step by step', () async {
      print('🚀 Testing field by field parsing...\n');

      // Get raw response
      final response = await dio.get('/products');
      expect(response.statusCode, 200);

      final data = response.data['data'] as Map<String, dynamic>;
      final products = data['data'] as List;
      final firstProduct = products.first as Map<String, dynamic>;

      print('📝 Step 1: Basic fields...');
      try {
        final id = firstProduct['id'] as String;
        final name = firstProduct['name'] as String;
        final slug = firstProduct['slug'] as String;
        print('✅ id, name, slug parsed successfully');
      } catch (e) {
        print('❌ Error parsing basic fields: $e');
        rethrow;
      }

      print('📝 Step 2: DateTime fields...');
      try {
        final createdAt = DateTime.parse(firstProduct['createdAt'] as String);
        final updatedAt = DateTime.parse(firstProduct['updatedAt'] as String);
        print('✅ createdAt, updatedAt parsed successfully');
      } catch (e) {
        print('❌ Error parsing DateTime fields: $e');
        rethrow;
      }

      print('📝 Step 3: Number fields...');
      try {
        final ratingAverage = firstProduct['ratingAverage'] as double?;
        final ratingCount = firstProduct['ratingCount'] as int?;
        print('✅ ratingAverage: $ratingAverage, ratingCount: $ratingCount');
      } catch (e) {
        print('❌ Error parsing number fields: $e');
        rethrow;
      }

      print('📝 Step 4: Nested objects (brand, category)...');
      try {
        final brand = firstProduct['brand'];
        final category = firstProduct['category'];
        print('✅ brand: $brand');
        print('✅ category: $category');
      } catch (e) {
        print('❌ Error parsing nested objects: $e');
        rethrow;
      }

      print('📝 Step 5: Arrays (variants, images)...');
      try {
        final variants = firstProduct['variants'] as List;
        final images = firstProduct['images'] as List;
        print('✅ variants count: ${variants.length}');
        print('✅ images count: ${images.length}');
      } catch (e) {
        print('❌ Error parsing arrays: $e');
        rethrow;
      }

      print('📝 Step 6: Try full ProductModel.fromJson...');
      try {
        final productModel = ProductModel.fromJson(firstProduct);
        print('✅ ProductModel parsed successfully!');
        print('📦 Product: ${productModel.name}');
      } catch (e) {
        print('❌ Error parsing full ProductModel: $e');
        print('🔍 Exception type: ${e.runtimeType}');
        print('🔍 Full exception: $e');

        // Try to identify problematic field
        print('\n🔬 Testing individual complex fields...');

        // Test variants parsing
        try {
          final variants = firstProduct['variants'] as List;
          if (variants.isNotEmpty) {
            final firstVariant = variants.first as Map<String, dynamic>;
            print('🧪 First variant raw: $firstVariant');

            // Try parsing individual variant fields
            print('  - id: ${firstVariant['id']}');
            print('  - status: ${firstVariant['status']}');
            print('  - inventory: ${firstVariant['inventory']}');
            print('  - prices: ${firstVariant['prices']}');
          }
        } catch (variantError) {
          print('❌ Error testing variants: $variantError');
        }

        rethrow;
      }

      print('\n🎉 All field parsing tests PASSED!');
    });
  });
}
