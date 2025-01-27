import 'package:flutter/material.dart';
import 'package:savvyflos/core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.router,
      initialRoute: RoutesManager.splash,
     // theme: AppTheme.light,
      //themeMode: ThemeMode.light,
    );
  }
}
