import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/listen/presentation/state/playlist_manager.dart';
import 'package:stopify/features/listen/presentation/widgets/floating_player/floating_player.dart';
import 'package:stopify/features/listen/presentation/widgets/hero/home_view_hero.dart';
import 'package:stopify/features/listen/presentation/widgets/home_view_playlist_container.dart';

class ListenView extends StatefulWidget {
  const ListenView({super.key});

  @override
  State<ListenView> createState() => _ListenViewState();
}

class _ListenViewState extends State<ListenView> {
  late final PlaylistManager _playlistManager;

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
    const double coverContainerWidth = 230;
    const double coverContainerHeight = 230;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        title: const Text(Constants.listenText),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.black,
      ),
      body: ListView(
        children: [
          HomeViewHero(
            coverContainerWidth: coverContainerWidth,
            coverContainerHeight: coverContainerHeight,
            playlistManager: _playlistManager,
          ),
          PlayListContainer(
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
