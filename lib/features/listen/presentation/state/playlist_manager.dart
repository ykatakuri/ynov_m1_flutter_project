import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stopify/features/listen/data/datasources/dump_data.dart';
import 'package:stopify/features/listen/presentation/notifiers/play_button_notifier.dart';
import 'package:stopify/features/listen/presentation/notifiers/progress_notifier.dart';
import 'package:tuple/tuple.dart';

class PlaylistManager {
  final currentSongTitleNotifier = ValueNotifier<String>('');
  final playlistNotifier = ValueNotifier<List<Tuple2<String, String>>>([]);
  final progressNotifier = ProgressNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);

  late AudioPlayer playlistAudioPlayer;
  late ConcatenatingAudioSource _playlist;

  PlaylistManager() {
    init();
  }

  void init() async {
    playlistAudioPlayer = AudioPlayer();
    setInitialPlaylist();
    listenForChangesInPlayerState();
    listenForChangesInPlayerPosition();
    listenForChangesInBufferedPosition();
    listenForChangesInTotalDuration();
    listenForChangesInSequenceState();
  }

  void setInitialPlaylist() async {
    _playlist = playlist;
    await playlistAudioPlayer.setAudioSource(_playlist);
  }

  void listenForChangesInPlayerState() {
    playlistAudioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        playlistAudioPlayer.seek(Duration.zero);
        playlistAudioPlayer.pause();
      }
    });
  }

  void listenForChangesInPlayerPosition() {
    playlistAudioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void listenForChangesInBufferedPosition() {
    playlistAudioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void listenForChangesInTotalDuration() {
    playlistAudioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void listenForChangesInSequenceState() {
    playlistAudioPlayer.sequenceStateStream.listen((sequenceState) {
      if (sequenceState == null) return;

      final currentItem = sequenceState.currentSource;
      final title = currentItem?.tag['item2'] as String?;
      currentSongTitleNotifier.value = title ?? '';

      final playlist = sequenceState.effectiveSequence;
      final tracks = playlist
          .map((item) => Tuple2<String, String>(
              item.tag['item1'] as String, item.tag['item2'] as String))
          .toList();
      playlistNotifier.value = tracks;

      isShuffleModeEnabledNotifier.value = sequenceState.shuffleModeEnabled;

      if (playlist.isEmpty || currentItem == null) {
        isFirstSongNotifier.value = true;
        isLastSongNotifier.value = true;
      } else {
        isFirstSongNotifier.value = playlist.first == currentItem;
        isLastSongNotifier.value = playlist.last == currentItem;
      }
    });
  }

  void play() {
    playlistAudioPlayer.play();
  }

  void pause() {
    playlistAudioPlayer.pause();
  }

  void dispose() {
    playlistAudioPlayer.dispose();
  }

  void seek(Duration position) {
    playlistAudioPlayer.seek(position);
  }

  void onPreviousSongButtonPressed() {
    playlistAudioPlayer.seekToPrevious();
  }

  void onNextSongButtonPressed() {
    playlistAudioPlayer.seekToNext();
  }

  void onShuffleButtonPressed() async {
    final enable = !playlistAudioPlayer.shuffleModeEnabled;
    if (enable) {
      await playlistAudioPlayer.shuffle();
    }
    await playlistAudioPlayer.setShuffleModeEnabled(enable);
  }
}
