import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:stopify/features/listen/presentation/state/playlist_manager.dart';
import 'package:stopify/shared/utils/progress_notifier.dart';

class ListenPlayerProgressBar extends StatelessWidget {
  const ListenPlayerProgressBar({
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
            baseBarColor: Colors.white,
            progressBarColor: Colors.amber,
            thumbColor: Colors.amber,
            timeLabelTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          );
        },
      ),
    );
  }
}
