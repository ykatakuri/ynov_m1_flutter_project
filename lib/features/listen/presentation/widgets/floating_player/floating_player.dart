import 'package:flutter/material.dart';
import 'package:stopify/features/listen/presentation/state/playlist_manager.dart';
import 'package:stopify/features/listen/presentation/widgets/custom_player/custom_player.dart';
import 'package:stopify/features/listen/presentation/widgets/floating_player/floating_player_controls.dart';

class FloatingPlayer extends StatelessWidget {
  const FloatingPlayer({
    super.key,
    required PlaylistManager playlistManager,
  }) : _playlistManager = playlistManager;

  final PlaylistManager _playlistManager;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.headphones,
            color: Colors.white70,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CurrentSongTitle(playlistManager: _playlistManager),
          ),
          FloatingPlayerControls(playlistManager: _playlistManager),
        ],
      ),
    );
  }
}
