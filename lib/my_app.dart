// import 'package:flutter/material.dart';
// import 'package:savvyflos/core/cashe/prefs_handler.dart';
// import 'package:savvyflos/core/utils/routes_manager.dart';
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: RoutesManager.router,
//       initialRoute:RoutesManager.splash ,
//       //PrefsHandler.getToken().isNotEmpty?RoutesManager.home:RoutesManager.login,
//      // theme: AppTheme.light,
//       //themeMode: ThemeMode.light,
//     );
//   }
//}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:savvyflos/core/cashe/prefs_handler.dart';
// import 'package:savvyflos/core/utils/routes_manager.dart';
// import 'package:savvyflos/presentation/screens/educationScreen/data/datasource/video_dataSource.dart';
// import 'package:savvyflos/presentation/screens/educationScreen/data/repositoryimpl/video_repo.dart';
// import 'package:savvyflos/presentation/screens/educationScreen/domain/usecase/get_videos_usecase.dart';
// import 'package:savvyflos/presentation/screens/educationScreen/presentation/video_view_model.dart';
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => VideoViewModel(
//             getVideosUseCase: GetVideosUseCase(
//               VideoRepositoryImpl(VideoRemoteDataSource()),
//             ),
//           ),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         onGenerateRoute: RoutesManager.router,
//         initialRoute: RoutesManager.splash,
//       ),
//     );
//   }
// }
