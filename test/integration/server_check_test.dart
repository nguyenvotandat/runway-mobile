import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

void main() {
  group('🔍 Server Status Check', () {
    late Dio dio;

    setUpAll(() {
      print('🔧 Checking server status...');
      dio = Dio();
      dio.options.baseUrl = 'http://localhost:3000';
      print('✅ Dio configured for localhost:3000\n');
    });

    test('🌐 should check if backend server is running', () async {
      print('🚀 Checking server health...');

      try {
        // Test basic server response
        final response = await dio.get(
          '/api',
        ); // ← BREAKPOINT 1: Đặt ở đây để debug API call
        print('✅ Server is running!');
        print('📊 Status: ${response.statusCode}');
        print('📦 Response: ${response.data}');

        expect(
          response.statusCode,
          200,
        ); // ← BREAKPOINT 2: Đặt ở đây để xem response trước khi assert
      } catch (e) {
        print('❌ Server is not running or not accessible');
        print('🔍 Error: $e');
        print('\n💡 Please start the backend server:');
        print('   cd d:\\Projects\\runway\\runway_backend');
        print('   npm run start:dev');

        fail('Backend server is not running. Please start it first.');
      }
    });

    test('🛍️ should check products endpoint specifically', () async {
      print('🚀 Checking products endpoint...');

      try {
        // Test products endpoint specifically
        final response = await dio.get(
          '/api/products',
        ); // ← BREAKPOINT 3: Debug Products API call
        print('✅ Products endpoint is working!');
        print('📊 Status: ${response.statusCode}');
        print('📦 Response type: ${response.data.runtimeType}');

        if (response.data is Map<String, dynamic>) {
          final data =
              response.data
                  as Map<String, dynamic>; // ← BREAKPOINT 4: Xem cấu trúc data
          print('📋 Response structure:');
          data.forEach((key, value) {
            print('   $key: ${value.runtimeType}');
          });
        }

        expect(response.statusCode, 200); // ← BREAKPOINT 5: Verify assertion
      } catch (e) {
        print('❌ Products endpoint failed');
        print('🔍 Error: $e');

        if (e is DioException) {
          print('🔍 Status Code: ${e.response?.statusCode}');
          print('🔍 Response: ${e.response?.data}');
        }

        rethrow;
      }
    });
  });
}
