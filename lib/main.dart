import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const RunwayApp());
}

class RunwayApp extends StatelessWidget {
  const RunwayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Runway Fashion',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // 🚧 Development mode: Route to playground, Production: Normal routing
      routerConfig: AppRouter.getRouter(kDebugMode),
      debugShowCheckedModeBanner: false,
    );
  }
}
