import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';

class PlayerButton extends StatelessWidget {
  const PlayerButton({
    required this.iconData,
    required this.iconSize,
    required this.onPressed,
    super.key,
  });

  final IconData iconData;
  final double iconSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      iconSize: iconSize,
      color: AppColors.secondaryColor,
      onPressed: onPressed,
    );
  }
}
