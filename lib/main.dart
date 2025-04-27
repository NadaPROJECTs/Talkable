// import 'package:flutter/material.dart';
// import 'package:savvyflos/core/DI/di.dart';
// import 'package:savvyflos/core/cashe/prefs_handler.dart';
// import 'package:savvyflos/my_app.dart';
//
// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   configureDependencies();
//   await PrefsHandler.init();
//   runApp(const MyApp());
//}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvyflos/presentation/screens/educationScreen/data/datasource/video_dataSource.dart';
import 'package:savvyflos/presentation/screens/educationScreen/data/repositoryimpl/video_repo.dart';
import 'package:savvyflos/presentation/screens/educationScreen/domain/usecase/get_videos_usecase.dart';
import 'package:savvyflos/presentation/screens/educationScreen/presentation/EducationScreen.dart';
import 'package:savvyflos/presentation/screens/educationScreen/presentation/video_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => VideoViewModel(
            getVideosUseCase: GetVideosUseCase(
              VideoRepositoryImpl(VideoRemoteDataSource()),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Talkable App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: EducationScreen(),
      ),
    );
  }
}