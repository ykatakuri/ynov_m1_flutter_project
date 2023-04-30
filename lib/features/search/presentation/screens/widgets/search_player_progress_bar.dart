import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:stopify/features/search/presentation/state/search_track_manager.dart';
import 'package:stopify/shared/utils/progress_notifier.dart';

class SearchPlayerProgressBar extends StatelessWidget {
  const SearchPlayerProgressBar({
    super.key,
    required SearchTrackManager trackManager,
  }) : _trackManager = trackManager;

  final SearchTrackManager _trackManager;

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
