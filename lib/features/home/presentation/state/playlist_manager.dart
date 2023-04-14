import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stopify/features/home/data/datasources/dump_data.dart';
import 'package:stopify/features/home/presentation/notifiers/play_button_notifier.dart';
import 'package:stopify/features/home/presentation/notifiers/progress_notifier.dart';

class PlaylistManager {
  final currentSongTitleNotifier = ValueNotifier<String>('');
  final playlistNotifier = ValueNotifier<List<String>>([]);
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

      // update current song title
      final currentItem = sequenceState.currentSource;
      final title = currentItem?.tag as String?;
      currentSongTitleNotifier.value = title ?? '';

      // update playlist
      final playlist = sequenceState.effectiveSequence;
      final titles = playlist.map((item) => item.tag as String).toList();
      playlistNotifier.value = titles;

      // update shuffle mode
      isShuffleModeEnabledNotifier.value = sequenceState.shuffleModeEnabled;

      // update previous and next buttons
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
