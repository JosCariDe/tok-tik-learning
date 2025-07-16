import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];
  final VideoPostRepository videoPostRepository ;

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    //Funciona como Init tambien

    await Future.delayed(const Duration(seconds: 2));

    final newVideos = await videoPostRepository.getTrandingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
