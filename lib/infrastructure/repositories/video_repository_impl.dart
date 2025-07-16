
import 'package:tiktok/domain/datasources/video_post_datasources.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/domain/repositories/video_post_repository.dart';

class VideoRepositoryImpl implements VideoPostRepository{

  final VideoPostDatasources videoPostDatasources;

  VideoRepositoryImpl({required this.videoPostDatasources}); 

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrandingVideosByPage(int page) {
    return videoPostDatasources.getTrandingVideosByPage(page);
  }


}