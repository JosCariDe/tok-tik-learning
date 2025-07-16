import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/config/theme/app_theme.dart';
import 'package:tiktok/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tiktok/infrastructure/repositories/video_repository_impl.dart';
import 'package:tiktok/presentation/providers/discover_provider.dart';
import 'package:tiktok/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoRepositoryImpl(
      videoPostDatasources: LocalVideoDatasourceImpl()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false, //! Se ejecute enseguida el constructor al iniciar la app, no espera a que se llame 
          create: (_) => DiscoverProvider(videoPostRepository: videoPostRepository)..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'Tok Tik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}