import 'package:flutter/material.dart';
import 'package:savvyflos/core/DI/di.dart';
import 'package:savvyflos/core/cashe/prefs_handler.dart';
import 'package:savvyflos/my_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await PrefsHandler.init();
  runApp(const MyApp());
}


