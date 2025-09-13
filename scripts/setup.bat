@echo off
echo 🚀 Setting up Runway Mobile App...

echo 📦 Installing dependencies...
flutter pub get

echo 🔨 Generating code...
flutter packages pub run build_runner build --delete-conflicting-outputs

echo ✅ Setup completed! Run 'flutter run' to start the app.
pause

