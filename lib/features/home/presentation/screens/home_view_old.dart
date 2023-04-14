import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/data/datasources/dump_data.dart';
import 'package:stopify/features/home/presentation/state/playlist_manager.dart';
import 'package:stopify/features/home/presentation/widgets/custom_player/custom_player.dart';
import 'package:text_helpers/text_helpers.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PlaylistManager _playlistManager;

  Future<Directory?>? _downloadsDirectory;

  void _requestDownloadsDirectory() {
    setState(() {
      _downloadsDirectory = getDownloadsDirectory();
    });
  }

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text(
          'Error: ${snapshot.error}',
          style: const TextStyle(color: AppColors.secondaryColor),
        );
      } else if (snapshot.hasData) {
        text = Text(
          'path: ${snapshot.data!.path}',
          style: const TextStyle(color: AppColors.secondaryColor),
        );
      } else {
        text = const Text(
          'path unavailable',
          style: TextStyle(color: AppColors.secondaryColor),
        );
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

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
    final songContainerWidth = mediaQuerySize.width * 0.95;
    const double songContainerHeight = 220;
    const double coverContainerWidth = 150;
    const double coverContainerHeight = 150;

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: CustomPlayer(playlistManager: _playlistManager),
                    );
                  },
                  isScrollControlled: true,
                );
              },
              icon: const Icon(
                Icons.play_circle_fill_rounded,
              ),
              iconSize: 45,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: musics.length,
        itemBuilder: (context, index) {
          return Container(
            width: songContainerWidth,
            height: songContainerHeight,
            margin: const EdgeInsets.only(
              left: 12,
              top: 16,
              right: 12,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryColor,
                  Colors.grey,
                ],
                transform: GradientRotation(10),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: musics[index].cover,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: coverContainerWidth,
                            height: coverContainerHeight,
                          ),
                          placeholder: (context, url) => const SizedBox(
                            width: coverContainerWidth,
                            height: coverContainerHeight,
                            child: CircularProgressIndicator(
                                color: AppColors.secondaryColor),
                          ),
                          errorWidget: (context, url, error) => const SizedBox(
                            width: coverContainerWidth,
                            height: coverContainerHeight,
                            child: Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Single',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              musics[index].title,
                              style: const TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            InlineText(
                              musics[index].artist,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _requestDownloadsDirectory,
                        icon: const Icon(
                          Icons.add_circle_outline,
                        ),
                        color: AppColors.secondaryColor,
                        iconSize: 35,
                      ),
                      Expanded(
                          child: FutureBuilder<Directory?>(
                        future: _downloadsDirectory,
                        builder: _buildDirectory,
                      )),
                      const Text(
                        '1 titre.s',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }
}
