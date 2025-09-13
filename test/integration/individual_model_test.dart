import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:runway_mobile/features/product/data/models/product_model.dart';
import 'package:runway_mobile/features/product/data/models/product_variant_model.dart';
import 'package:runway_mobile/features/product/data/models/price_model.dart';

void main() {
  group('🔧 Individual Model Tests', () {
    late Dio dio;

    setUpAll(() {
      print('🔧 Setting up Individual Model Tests...');
      dio = Dio();
      dio.options.baseUrl = 'http://localhost:3000/api';
      print('✅ Individual Model test setup complete!\n');
    });

    test('🧪 should parse PriceModel individually', () async {
      print('🚀 Testing PriceModel parsing...');

      final response = await dio.get('/products');
      final data = response.data['data'] as Map<String, dynamic>;
      final products = data['data'] as List;
      final firstProduct = products.first as Map<String, dynamic>;
      final variants = firstProduct['variants'] as List;
      final firstVariant = variants.first as Map<String, dynamic>;
      final prices = firstVariant['prices'] as List;
      final firstPrice = prices.first as Map<String, dynamic>;

      print('💰 Raw price data:');
      firstPrice.forEach((key, value) {
        print('   $key: $value (${value.runtimeType})');
      });

      try {
        final priceModel = PriceModel.fromJson(firstPrice);
        print('✅ PriceModel parsed successfully!');
        print('📦 Price: ${priceModel.amount} ${priceModel.currency}');
      } catch (e) {
        print('❌ PriceModel parsing failed: $e');
        rethrow;
      }
    });

    test('🧪 should parse ProductVariantModel individually', () async {
      print('🚀 Testing ProductVariantModel parsing...');

      final response = await dio.get('/products');
      final data = response.data['data'] as Map<String, dynamic>;
      final products = data['data'] as List;
      final firstProduct = products.first as Map<String, dynamic>;
      final variants = firstProduct['variants'] as List;
      final firstVariant = variants.first as Map<String, dynamic>;

      print('🔧 Raw variant data:');
      firstVariant.forEach((key, value) {
        print('   $key: $value (${value.runtimeType})');
      });

      try {
        final variantModel = ProductVariantModel.fromJson(firstVariant);
        print('✅ ProductVariantModel parsed successfully!');
        print('📦 Variant: ${variantModel.sku} - ${variantModel.status}');
        print('🎨 Color: ${variantModel.color?.name}');
        print('📏 Size: ${variantModel.size?.label}');
        print('💰 Prices count: ${variantModel.prices.length}');
      } catch (e) {
        print('❌ ProductVariantModel parsing failed: $e');
        print('🔍 Exception type: ${e.runtimeType}');

        // Try parsing each sub-component
        print('\n🔬 Testing individual variant components...');

        try {
          final colorData = firstVariant['color'] as Map<String, dynamic>;
          print('🎨 Color data: $colorData');
        } catch (colorError) {
          print('❌ Color parsing issue: $colorError');
        }

        try {
          final sizeData = firstVariant['size'] as Map<String, dynamic>;
          print('📏 Size data: $sizeData');
        } catch (sizeError) {
          print('❌ Size parsing issue: $sizeError');
        }

        try {
          final inventoryData =
              firstVariant['inventory'] as Map<String, dynamic>;
          print('📦 Inventory data: $inventoryData');
        } catch (inventoryError) {
          print('❌ Inventory parsing issue: $inventoryError');
        }

        rethrow;
      }
    });

    test('🧪 should parse complete ProductModel step by step', () async {
      print('🚀 Testing complete ProductModel parsing...');

      final response = await dio.get('/products');
      final data = response.data['data'] as Map<String, dynamic>;
      final products = data['data'] as List;
      final firstProduct = products.first as Map<String, dynamic>;

      print('📝 Attempting ProductModel.fromJson...');
      try {
        final productModel = ProductModel.fromJson(firstProduct);
        print('✅ ProductModel parsed successfully!');
        print('📦 Product: ${productModel.name}');
        print('🔧 Variants: ${productModel.variants.length}');
        print('🖼️ Images: ${productModel.images.length}');
      } catch (e) {
        print('❌ ProductModel parsing failed: $e');
        print('🔍 Exception type: ${e.runtimeType}');
        rethrow;
      }
    });
  });
}
