import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/features/home/presentation/state/view_manager.dart';
import 'package:stopify/features/home/presentation/widgets/player_controls.dart';
import 'package:stopify/features/home/presentation/widgets/player_progress_bar.dart';
import 'package:text_helpers/text_helpers.dart';

class CustomPlayer extends StatelessWidget {
  const CustomPlayer({
    super.key,
    required ViewManager viewManager,
  }) : _viewManager = viewManager;

  final ViewManager _viewManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          const SizedBox(height: 42),
          Center(
            child: CurrentSongTitle(viewManager: _viewManager),
          ),
          const SizedBox(height: 150),
          PlayerProgressBar(viewManager: _viewManager),
          PlayerControls(viewManager: _viewManager),
        ],
      ),
    );
  }
}

class CurrentSongTitle extends StatelessWidget {
  const CurrentSongTitle({
    required this.viewManager,
    Key? key,
  }) : super(key: key);

  final ViewManager viewManager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: viewManager.currentSongTitleNotifier,
      builder: (_, title, __) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: InlineText(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.secondaryColor,
            ),
          ),
        );
      },
    );
  }
}
