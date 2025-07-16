
import 'package:tiktok/domain/datasources/video_post_datasources.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/infrastructure/models/local_video_model.dart';
import 'package:tiktok/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasources {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrandingVideosByPage(int page) async{

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVIdeoPostEntity())
        .toList();


    return newVideos;

  }



}
