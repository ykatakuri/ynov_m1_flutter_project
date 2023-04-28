import 'package:flutter/material.dart';
import 'package:stopify/shared/presentation/state/track_manager.dart';
import 'package:stopify/shared/presentation/widgets/player_button.dart';

class TrackPlayerButton extends StatelessWidget {
  const TrackPlayerButton({
    super.key,
    required this.trackManager,
  });

  final TrackManager trackManager;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<ButtonState>(
        valueListenable: trackManager.buttonNotifier,
        builder: (_, value, __) {
          switch (value) {
            case ButtonState.loading:
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 32.0,
                height: 32.0,
                child: const CircularProgressIndicator(),
              );
            case ButtonState.paused:
              return PlayerButton(
                iconData: Icons.play_arrow,
                iconSize: 60,
                onPressed: trackManager.play,
              );
            case ButtonState.playing:
              return PlayerButton(
                iconData: Icons.pause,
                iconSize: 60,
                onPressed: trackManager.pause,
              );
          }
        },
      ),
    );
  }
}
