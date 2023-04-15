import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/features/home/presentation/state/playlist_manager.dart';
import 'package:stopify/features/home/presentation/widgets/hero/hero_button.dart';
import 'package:stopify/features/home/presentation/widgets/hero/hero_cover.dart';

class HomeViewHero extends StatelessWidget {
  const HomeViewHero({
    super.key,
    required this.coverContainerWidth,
    required this.coverContainerHeight,
    required this.playlistManager,
  });

  final double coverContainerWidth;
  final double coverContainerHeight;

  final PlaylistManager playlistManager;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 10),
          HeroCover(
            coverContainerWidth: coverContainerWidth,
            coverContainerHeight: coverContainerHeight,
          ),
          const SizedBox(height: 10),
          const Text(
            'Playlist',
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HeroButton(
                icon: const Icon(
                  Icons.play_arrow,
                ),
                text: 'Lecture',
                onPressed: playlistManager.play,
              ),
              HeroButton(
                icon: const Icon(
                  Icons.shuffle,
                ),
                text: 'Aléatoire',
                onPressed: playlistManager.onShuffleButtonPressed,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Divider(
              height: 2,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
