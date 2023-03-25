import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/presentation/state/view_manager.dart';
import 'package:stopify/features/home/presentation/widgets/player_button.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({
    super.key,
    required ViewManager viewManager,
  }) : _viewManager = viewManager;

  final ViewManager _viewManager;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PlayerButton(
          iconData: Icons.skip_previous,
          iconSize: Constants.previousAndNextIconSize,
          onPressed: () {},
        ),
        ValueListenableBuilder<ButtonState>(
          valueListenable: _viewManager.buttonNotifier,
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
                  onPressed: _viewManager.play,
                );
              case ButtonState.playing:
                return PlayerButton(
                  iconData: Icons.pause_circle_outline_rounded,
                  iconSize: Constants.playAndPauseIconSize,
                  onPressed: _viewManager.pause,
                );
            }
          },
        ),
        PlayerButton(
          iconData: Icons.skip_next,
          iconSize: Constants.previousAndNextIconSize,
          onPressed: () {},
        ),
      ],
    );
  }
}
