import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/splash_page/view/splash_view.dart';
import 'utils/navigation_manager/navigation_manager.dart';
import 'utils/navigation_manager/navigation_route.dart';
import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ColorTheme().theme,
      title: 'MARS Study Case',
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationManager.instance.navigatorKey,
      home: const SplashView(),
    );
  }
}
