@echo off
echo.
echo ================================================
echo 🚀 RUNWAY MOBILE API INTEGRATION TEST RUNNER
echo ================================================
echo.

REM Check if we're in the right directory
if not exist "pubspec.yaml" (
    echo ❌ Error: pubspec.yaml not found. Please run this script from the Flutter project root.
    pause
    exit /b 1
)

echo 🔧 Preparing test environment...
echo.

REM Get Flutter dependencies
echo 📦 Getting Flutter dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo ❌ Failed to get dependencies
    pause
    exit /b 1
)

echo.
echo 🧪 Starting Integration Tests...
echo.

REM Run specific integration tests
echo 🔍 Running Product API Integration Tests...
flutter test test/integration/product_api_test.dart --verbose

echo.
echo ================================================
echo ✅ Integration Tests Completed
echo ================================================
echo.
echo 📊 Check the output above for detailed results
echo 🔍 Look for:
echo    - ✅ PASSED tests (successful API calls)
echo    - ❌ FAILED tests (need investigation)  
echo    - ⚠️  WARNING tests (expected failures)
echo.
echo 💡 Tips:
echo    - Make sure your backend server is running
echo    - Check API endpoints in constants.dart
echo    - Verify network connectivity
echo.

pause