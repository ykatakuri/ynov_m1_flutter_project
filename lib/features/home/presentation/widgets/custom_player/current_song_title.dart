import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/features/home/presentation/state/playlist_manager.dart';

class CurrentSongTitle extends StatelessWidget {
  const CurrentSongTitle({
    required this.playlistManager,
    Key? key,
  }) : super(key: key);

  final PlaylistManager playlistManager;

  @override
  Widget build(BuildContext context) {
    const double fontSize = 14;
    return ValueListenableBuilder<String>(
      valueListenable: playlistManager.currentSongTitleNotifier,
      builder: (_, title, __) {
        return Text(
          title,
          style: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryColor,
          ),
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}
