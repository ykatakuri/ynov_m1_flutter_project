import 'package:flutter/material.dart';
import 'package:stopify/features/listen/presentation/state/playlist_manager.dart';
import 'package:stopify/features/listen/presentation/widgets/custom_player/listen_player_progress_bar.dart';
import 'package:stopify/features/listen/presentation/widgets/custom_player/player_controls.dart';

class CustomPlayer extends StatelessWidget {
  const CustomPlayer({
    super.key,
    required PlaylistManager playlistManager,
  }) : _playlistManager = playlistManager;

  final PlaylistManager _playlistManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          const SizedBox(height: 42),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                color: Colors.white,
              ),
              const SizedBox(width: 100),
              CurrentSongTitle(playlistManager: _playlistManager),
            ],
          ),
          const SizedBox(height: 150),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black,
                  Colors.grey,
                ],
                transform: GradientRotation(10),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ListenPlayerProgressBar(playlistManager: _playlistManager),
                PlayerControls(playlistManager: _playlistManager),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentSongTitle extends StatelessWidget {
  const CurrentSongTitle({
    required this.playlistManager,
    Key? key,
  }) : super(key: key);

  final PlaylistManager playlistManager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: playlistManager.currentSongTitleNotifier,
      builder: (_, title, __) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
