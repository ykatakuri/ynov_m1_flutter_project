import 'package:flutter/material.dart';
import 'package:stopify/features/library/presentation/state/library_manager.dart';
import 'package:stopify/shared/presentation/widgets/player_button.dart';

class LibraryPlayerButton extends StatelessWidget {
  const LibraryPlayerButton({
    super.key,
    required this.libraryManager,
  });

  final LibraryManager libraryManager;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<ButtonState>(
        valueListenable: libraryManager.buttonNotifier,
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
                onPressed: libraryManager.play,
              );
            case ButtonState.playing:
              return PlayerButton(
                iconData: Icons.pause,
                iconSize: 60,
                onPressed: libraryManager.pause,
              );
          }
        },
      ),
    );
  }
}
