import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/presentation/state/view_manager.dart';
import 'package:stopify/features/home/presentation/widgets/player_controls.dart';
import 'package:stopify/features/home/presentation/widgets/player_progress_bar.dart';

class CustomPlayer extends StatelessWidget {
  const CustomPlayer({
    super.key,
    required ViewManager viewManager,
  }) : _viewManager = viewManager;

  final ViewManager _viewManager;

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    final width = mediaQuerySize.width * 0.95;

    return Card(
      elevation: Constants.playerElevation,
      color: AppColors.primaryColor,
      shadowColor: AppColors.shadowColor,
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            PlayerProgressBar(viewManager: _viewManager),
            PlayerControls(viewManager: _viewManager),
          ],
        ),
      ),
    );
  }
}
