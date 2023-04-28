import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/shared/data/models/music_model.dart';
import 'package:stopify/shared/presentation/screens/widgets/player_progress_bar.dart';
import 'package:stopify/shared/presentation/state/track_manager.dart';
import 'package:stopify/shared/presentation/widgets/player_button.dart';
import 'package:text_scroll/text_scroll.dart';

class TrackPlayer extends StatefulWidget {
  const TrackPlayer({super.key});

  @override
  State<TrackPlayer> createState() => _TrackPlayerState();
}

class _TrackPlayerState extends State<TrackPlayer> {
  late TrackManager trackManager;

  @override
  void initState() {
    super.initState();

    trackManager = TrackManager();
  }

  @override
  void dispose() {
    trackManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Music;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.black,
      ),
      body: ListView(
        children: [
          AlbumImageContainer(
            albumImage: args.albumImage ?? Constants.coverURL,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: TextScroll(
              args.name ?? 'Title',
              mode: TextScrollMode.endless,
              velocity: const Velocity(pixelsPerSecond: Offset(40, 0)),
              delayBefore: const Duration(milliseconds: 500),
              pauseBetween: const Duration(milliseconds: 50),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
              selectable: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text(
              args.artistName ?? 'Artist',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          PlayerProgressBar(trackManager: trackManager),
          const SizedBox(height: 20),
          TrackPlayerButton(trackManager: trackManager),
        ],
      ),
    );
  }
}

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

class AlbumImageContainer extends StatelessWidget {
  const AlbumImageContainer({
    required this.albumImage,
    super.key,
  });

  final String albumImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(albumImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
