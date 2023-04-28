import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:stopify/shared/presentation/state/track_manager.dart';
import 'package:stopify/shared/utils/progress_notifier.dart';

class PlayerProgressBar extends StatelessWidget {
  const PlayerProgressBar({
    super.key,
    required TrackManager trackManager,
  }) : _trackManager = trackManager;

  final TrackManager _trackManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
      child: ValueListenableBuilder<ProgressBarState>(
        valueListenable: _trackManager.progressNotifier,
        builder: (_, value, __) {
          return ProgressBar(
            progress: value.current,
            total: value.total,
            buffered: value.buffered,
            onSeek: _trackManager.seek,
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
