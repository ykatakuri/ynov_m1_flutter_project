import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/features/home/presentation/state/playlist_manager.dart';
import 'package:stopify/features/home/presentation/widgets/custom_player.dart';
import 'package:stopify/features/home/presentation/widgets/floating_player_controls.dart';

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
            AppColors.primaryColor,
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
