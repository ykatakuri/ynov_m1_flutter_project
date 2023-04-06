import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
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
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor,
            Colors.grey,
          ],
          transform: GradientRotation(10),
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          PlayerProgressBar(viewManager: _viewManager),
          PlayerControls(viewManager: _viewManager),
        ],
      ),
    );
  }
}
