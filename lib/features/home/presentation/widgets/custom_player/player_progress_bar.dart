import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/features/home/presentation/notifiers/progress_notifier.dart';
import 'package:stopify/features/home/presentation/state/playlist_manager.dart';

class PlayerProgressBar extends StatelessWidget {
  const PlayerProgressBar({
    super.key,
    required PlaylistManager playlistManager,
  }) : _playlistManager = playlistManager;

  final PlaylistManager _playlistManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
      child: ValueListenableBuilder<ProgressBarState>(
        valueListenable: _playlistManager.progressNotifier,
        builder: (_, value, __) {
          return ProgressBar(
            progress: value.current,
            total: value.total,
            buffered: value.buffered,
            onSeek: _playlistManager.seek,
            baseBarColor: AppColors.secondaryColor,
            progressBarColor: AppColors.progressBarColor,
            thumbColor: AppColors.progressBarColor,
            timeLabelTextStyle: const TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w700,
            ),
          );
        },
      ),
    );
  }
}
