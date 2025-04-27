

import 'package:savvyflos/presentation/screens/educationScreen/data/datasource/video_dataSource.dart';
import 'package:savvyflos/presentation/screens/educationScreen/domain/entity/video.dart';
import 'package:savvyflos/presentation/screens/educationScreen/domain/repository/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteDataSource remoteDataSource;

  VideoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Video>> getVideos() {
    return remoteDataSource.fetchVideos();
  }
}