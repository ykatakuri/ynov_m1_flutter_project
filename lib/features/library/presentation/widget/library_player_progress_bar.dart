import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:stopify/features/library/presentation/state/library_manager.dart';
import 'package:stopify/shared/utils/progress_notifier.dart';

class LibraryPlayerProgressBar extends StatelessWidget {
  const LibraryPlayerProgressBar({
    super.key,
    required LibraryManager libraryManager,
  }) : _libraryManager = libraryManager;

  final LibraryManager _libraryManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
      child: ValueListenableBuilder<ProgressBarState>(
        valueListenable: _libraryManager.progressNotifier,
        builder: (_, value, __) {
          return ProgressBar(
            progress: value.current,
            total: value.total,
            buffered: value.buffered,
            onSeek: _libraryManager.seek,
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
