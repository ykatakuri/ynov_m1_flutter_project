import 'package:flutter/material.dart';
import 'package:stopify/features/listen/presentation/widgets/custom_player/player_button.dart';
import 'package:stopify/features/radio/presentation/state/radio_manager.dart';

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({super.key});

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  late RadioManager radioManager;

  @override
  void initState() {
    super.initState();

    radioManager = RadioManager();
  }

  @override
  void dispose() {
    radioManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const RadioNameContainer(),
          const StaticIconContainer(),
          const LiveLabelContainer(),
          RadioPlayerButton(radioManager: radioManager),
        ],
      ),
    );
  }
}

class RadioPlayerButton extends StatelessWidget {
  const RadioPlayerButton({
    super.key,
    required this.radioManager,
  });

  final RadioManager radioManager;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<ButtonState>(
        valueListenable: radioManager.buttonNotifier,
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
                onPressed: radioManager.play,
              );
            case ButtonState.playing:
              return PlayerButton(
                iconData: Icons.pause,
                iconSize: 60,
                onPressed: radioManager.pause,
              );
          }
        },
      ),
    );
  }
}

class LiveLabelContainer extends StatelessWidget {
  const LiveLabelContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        margin: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.grey,
              Colors.black,
              Colors.grey,
            ],
            transform: GradientRotation(10),
          ),
        ),
        child: Center(
          child: Text(
            'En direct'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class StaticIconContainer extends StatelessWidget {
  const StaticIconContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.grey,
          ],
          transform: GradientRotation(20),
        ),
      ),
      child: const Icon(
        Icons.more_horiz,
        color: Colors.white,
      ),
    );
  }
}

class RadioNameContainer extends StatelessWidget {
  const RadioNameContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 2,
        color: Colors.transparent,
        shadowColor: Colors.white12,
        child: Container(
          width: 300,
          height: 250,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Colors.grey,
              ],
              transform: GradientRotation(10),
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
                color: Colors.black,
              ),
              child: const Text(
                'Radio name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
