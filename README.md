# Runway Mobile - Fashion E-commerce App

Ứng dụng thời trang Runway được phát triển với Flutter, sử dụng Clean Architecture và MVVM pattern.

## 🚀 Tính năng

- **Authentication**: Đăng nhập/Đăng ký với JWT
- **Product Catalog**: Danh mục và tìm kiếm sản phẩm
- **3D Product Viewer**: Xem sản phẩm với mô hình 3D
- **Shopping Cart**: Giỏ hàng và thanh toán
- **User Profile**: Quản lý tài khoản cá nhân

## 🏗️ Kiến trúc

### Clean Architecture với MVVM
```
lib/
├── core/                    # Core modules
│   ├── router/             # GoRouter configuration
│   ├── theme/              # App theme and styling
│   ├── di/                 # Dependency injection
│   ├── utils/              # Utilities and extensions
│   └── errors/             # Error handling
│
├── features/               # Feature modules
│   ├── auth/
│   │   ├── presentation/   # UI (pages, widgets)
│   │   ├── application/    # BLoC/Cubit
│   │   ├── domain/         # Entities, repositories, use cases
│   │   └── data/           # Models, data sources, repository impl
│   ├── catalog/
│   ├── product/
│   ├── cart/
│   └── profile/
│
└── main.dart               # App entry point
```

## 📦 Dependencies

### Main Dependencies
- **flutter_bloc**: State management
- **get_it**: Dependency injection
- **go_router**: Navigation
- **dio**: HTTP client
- **dartz**: Functional programming
- **freezed**: Code generation
- **model_viewer_plus**: 3D model viewer

## 🔧 Setup

### 1. Clone và cài đặt dependencies
```bash
cd runway_mobile
flutter pub get
```

### 2. Generate code
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 3. Chạy ứng dụng
```bash
flutter run
```

## 🌐 Backend Integration

App kết nối với Runway Backend API tại `http://localhost:3000/api`

### API Endpoints:
- **Auth**: `/auth/login`, `/auth/register`, `/auth/logout`
- **Categories**: `/categories`
- **Products**: `/products`, `/products/:id`

## 📱 Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🎨 Assets

- `assets/images/`: Hình ảnh static
- `assets/animations/`: File Lottie/Rive animations
- `assets/models/`: File 3D models (GLB/GLTF)

## 🔐 Security

- Token storage với FlutterSecureStorage
- Input validation
- Error handling toàn diện

## 🧪 Testing

```bash
flutter test
```

## 📝 Notes

- Sử dụng Material 3 design
- Dark/Light theme support
- Responsive design cho mọi screen size
- Offline capability (planned)