import 'package:flutter/material.dart';

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
      color: Colors.white,
      onPressed: onPressed,
    );
  }
}
