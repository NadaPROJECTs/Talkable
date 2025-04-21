import 'package:flutter/material.dart';
import 'package:savvyflos/core/cashe/prefs_handler.dart';
import 'package:savvyflos/core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.router,
      initialRoute:RoutesManager.splash ,
      //PrefsHandler.getToken().isNotEmpty?RoutesManager.home:RoutesManager.login,
     // theme: AppTheme.light,
      //themeMode: ThemeMode.light,
    );
  }
}
