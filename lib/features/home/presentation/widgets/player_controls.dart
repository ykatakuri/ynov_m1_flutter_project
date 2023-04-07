import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/presentation/notifiers/play_button_notifier.dart';
import 'package:stopify/features/home/presentation/state/playlist_manager.dart';
import 'package:stopify/features/home/presentation/widgets/player_button.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({
    super.key,
    required PlaylistManager playlistManager,
  }) : _playlistManager = playlistManager;

  final PlaylistManager _playlistManager;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: _playlistManager.isFirstSongNotifier,
          builder: (_, isFirst, __) {
            return PlayerButton(
              iconData: Icons.skip_previous,
              iconSize: Constants.previousAndNextIconSize,
              onPressed: (isFirst)
                  ? null
                  : _playlistManager.onPreviousSongButtonPressed,
            );
          },
        ),
        ValueListenableBuilder<ButtonState>(
          valueListenable: _playlistManager.playButtonNotifier,
          builder: (_, value, __) {
            switch (value) {
              case ButtonState.loading:
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 32.0,
                  height: 32.0,
                  child: const CircularProgressIndicator(
                    color: AppColors.secondaryColor,
                  ),
                );
              case ButtonState.paused:
                return PlayerButton(
                  iconData: Icons.play_circle_fill_rounded,
                  iconSize: Constants.playAndPauseIconSize,
                  onPressed: _playlistManager.play,
                );
              case ButtonState.playing:
                return PlayerButton(
                  iconData: Icons.pause_circle_outline_rounded,
                  iconSize: Constants.playAndPauseIconSize,
                  onPressed: _playlistManager.pause,
                );
            }
          },
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _playlistManager.isLastSongNotifier,
          builder: (_, isLast, __) {
            return PlayerButton(
              iconData: Icons.skip_next,
              iconSize: Constants.previousAndNextIconSize,
              onPressed:
                  (isLast) ? null : _playlistManager.onNextSongButtonPressed,
            );
          },
        ),
      ],
    );
  }
}
