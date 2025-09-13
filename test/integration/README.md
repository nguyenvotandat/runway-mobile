# 🧪 Product API Integration Tests

Đây là bộ test integration cho Product API của Runway Mobile App, được thiết kế để test các endpoint API thực với backend server.

## 📁 Cấu trúc Files

```
test/integration/
├── product_api_test.dart      # Main test suite cho Product API
├── test_runner.dart           # Test runner tổng hợp
└── README.md                  # Documentation này

scripts/
└── run_integration_tests.bat  # Windows script để chạy tests
```

## 🎯 Các Test Cases

### ✅ Core API Tests
- **Get Products** - Test pagination và filtering
- **Get Product Detail** - Test chi tiết sản phẩm
- **Search Products** - Test tìm kiếm
- **Featured Products** - Test sản phẩm nổi bật
- **Category Products** - Test sản phẩm theo danh mục

### 🔧 Technical Tests  
- **Network Timeout** - Test xử lý timeout
- **Server Errors** - Test xử lý lỗi 404, 500
- **API Connectivity** - Test kết nối server
- **Data Structure Validation** - Test cấu trúc response

### ⚡ Performance Tests
- **Concurrent Requests** - Test đồng thời nhiều request
- **Large Pagination** - Test pagination với data lớn
- **Response Time** - Test thời gian phản hồi
- **Edge Case Parameters** - Test với tham số bất thường

### 🔒 Security Tests
- **SQL Injection** - Test bảo mật injection
- **XSS Protection** - Test bảo mật XSS
- **Path Traversal** - Test bảo mật đường dẫn

## 🚀 Cách Chạy Tests

### Option 1: Sử dụng Script (Recommended)
```bash
# Windows
scripts\run_integration_tests.bat
```

### Option 2: Flutter Command Line
```bash
# Chạy tất cả integration tests
flutter test test/integration/

# Chỉ chạy Product API tests
flutter test test/integration/product_api_test.dart --verbose

# Chạy với output chi tiết
flutter test test/integration/product_api_test.dart --verbose --reporter=expanded
```

### Option 3: VS Code
1. Mở file `test/integration/product_api_test.dart`
2. Click vào icon "Run" bên cạnh `void main()`
3. Hoặc sử dụng `Ctrl+F5` để chạy test

## ⚙️ Cấu Hình

### Backend Server
Đảm bảo backend server đang chạy và cấu hình đúng URL trong:
```dart
// lib/core/utils/constants.dart
class AppConstants {
  static const String baseUrl = 'http://localhost:3000/api'; // ← Update này
}
```

### Test Environment
1. **Dependencies**: Chạy `flutter pub get` trước
2. **Server Status**: Đảm bảo backend API server đang chạy
3. **Network**: Kiểm tra kết nối mạng
4. **Data**: Server cần có ít nhất 1 product để test pass

## 📊 Hiểu Kết Quả Test

### ✅ PASSED (Màu xanh)
- API endpoint hoạt động bình thường
- Data structure đúng format
- Response time acceptable

### ❌ FAILED (Màu đỏ) 
- Server không phản hồi hoặc lỗi
- Data structure không đúng
- Network/connection issues
- **⚠️ Cần investigate ngay**

### ⚠️ WARNING (Màu vàng)
- Endpoint chưa implement (expected failure)
- Filter không có data phù hợp
- Optional test cases
- **💡 Có thể ignore nếu expected**

## 🐛 Troubleshooting

### "Server unreachable" Errors
```bash
# Kiểm tra server đang chạy
curl http://localhost:3000/api/products

# Kiểm tra network
ping localhost
```

### "No products found" Errors  
- Đảm bảo database có data
- Chạy seed script cho backend
- Kiểm tra pagination parameters

### Build/Dependency Errors
```bash
# Clean và rebuild
flutter clean
flutter pub get
flutter pub deps

# Regenerate code nếu cần
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## 📈 Performance Benchmarks

### Expected Response Times
- **Get Products**: < 2000ms
- **Product Detail**: < 1500ms  
- **Search**: < 3000ms
- **Concurrent Requests**: < 5000ms total

### Success Rate Targets
- **Core APIs**: 100% (critical)
- **Search/Filter**: 90%+ (optional features)
- **Performance Tests**: 80%+ (network dependent)

## 🔄 CI/CD Integration

Để tích hợp vào CI/CD pipeline:

```yaml
# GitHub Actions example
- name: Run Integration Tests
  run: |
    flutter pub get
    flutter test test/integration/ --verbose
  env:
    API_BASE_URL: ${{ secrets.API_BASE_URL }}
```

## 📝 Contributing

Khi thêm test cases mới:

1. **Follow naming convention**: `test('🎯 should do something', () async {`
2. **Add descriptive prints**: Để dễ debug
3. **Use proper expects**: Validate response structure
4. **Handle exceptions**: Wrap trong try-catch với meaningful messages
5. **Update README**: Document test cases mới

## 📞 Support

Nếu có vấn đề với tests:
1. Check backend server status
2. Verify API endpoints trong constants.dart  
3. Review test logs cho error details
4. Check network connectivity

---
**Happy Testing! 🚀**