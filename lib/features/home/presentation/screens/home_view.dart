import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/presentation/state/playlist_manager.dart';
import 'package:stopify/features/home/presentation/widgets/floating_player/floating_player.dart';
import 'package:stopify/features/home/presentation/widgets/hero/home_view_hero.dart';
import 'package:stopify/features/home/presentation/widgets/home_view_playlist_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PlaylistManager _playlistManager;

  // Future<Directory?>? _downloadsDirectory;

  // void _requestDownloadsDirectory() {
  //   setState(() {
  //     _downloadsDirectory = getDownloadsDirectory();
  //   });
  // }

  // Widget _buildDirectory(
  //     BuildContext context, AsyncSnapshot<Directory?> snapshot) {
  //   Text text = const Text('');
  //   if (snapshot.connectionState == ConnectionState.done) {
  //     if (snapshot.hasError) {
  //       text = Text(
  //         'Error: ${snapshot.error}',
  //         style: const TextStyle(color: AppColors.secondaryColor),
  //       );
  //     } else if (snapshot.hasData) {
  //       text = Text(
  //         'path: ${snapshot.data!.path}',
  //         style: const TextStyle(color: AppColors.secondaryColor),
  //       );
  //     } else {
  //       text = const Text(
  //         'path unavailable',
  //         style: TextStyle(color: AppColors.secondaryColor),
  //       );
  //     }
  //   }
  //   return Padding(padding: const EdgeInsets.all(16.0), child: text);
  // }

  @override
  void initState() {
    _playlistManager = PlaylistManager();

    super.initState();
  }

  @override
  void dispose() {
    _playlistManager.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    final heroContainerHeight = mediaQuerySize.height / 2;
    const double coverContainerWidth = 230;
    const double coverContainerHeight = 230;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        title: const Text(Constants.appName),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: AppColors.secondaryColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: AppColors.primaryColor,
      ),
      body: ListView(
        children: [
          HomeViewHero(
            heroContainerHeight: heroContainerHeight,
            coverContainerWidth: coverContainerWidth,
            coverContainerHeight: coverContainerHeight,
            playlistManager: _playlistManager,
          ),
          PlayListContainer(
            mediaQuerySize: mediaQuerySize,
            playlistManager: _playlistManager,
          ),
        ],
      ),
      floatingActionButton: FloatingPlayer(
        playlistManager: _playlistManager,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
