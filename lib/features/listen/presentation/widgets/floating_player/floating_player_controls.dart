import 'package:flutter/material.dart';
import 'package:stopify/features/listen/presentation/notifiers/play_button_notifier.dart';
import 'package:stopify/features/listen/presentation/state/playlist_manager.dart';
import 'package:stopify/features/listen/presentation/widgets/custom_player/player_button.dart';

class FloatingPlayerControls extends StatelessWidget {
  const FloatingPlayerControls({
    super.key,
    required PlaylistManager playlistManager,
  }) : _playlistManager = playlistManager;

  final PlaylistManager _playlistManager;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 35;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PreviousButton(playlistManager: _playlistManager, iconSize: iconSize),
        PlayButton(playlistManager: _playlistManager, iconSize: iconSize),
        NextButton(playlistManager: _playlistManager, iconSize: iconSize),
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required PlaylistManager playlistManager,
    required this.iconSize,
  }) : _playlistManager = playlistManager;

  final PlaylistManager _playlistManager;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _playlistManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return PlayerButton(
          iconData: Icons.skip_next,
          iconSize: iconSize,
          onPressed: (isLast) ? null : _playlistManager.onNextSongButtonPressed,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required PlaylistManager playlistManager,
    required this.iconSize,
  }) : _playlistManager = playlistManager;

  final PlaylistManager _playlistManager;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ButtonState>(
      valueListenable: _playlistManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case ButtonState.paused:
            return PlayerButton(
              iconData: Icons.play_circle_fill_rounded,
              iconSize: iconSize,
              onPressed: _playlistManager.play,
            );
          case ButtonState.playing:
            return PlayerButton(
              iconData: Icons.pause_circle_outline_rounded,
              iconSize: iconSize,
              onPressed: _playlistManager.pause,
            );
        }
      },
    );
  }
}

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    super.key,
    required PlaylistManager playlistManager,
    required this.iconSize,
  }) : _playlistManager = playlistManager;

  final PlaylistManager _playlistManager;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _playlistManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return PlayerButton(
          iconData: Icons.skip_previous,
          iconSize: iconSize,
          onPressed:
              (isFirst) ? null : _playlistManager.onPreviousSongButtonPressed,
        );
      },
    );
  }
}
