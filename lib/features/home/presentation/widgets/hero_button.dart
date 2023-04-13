import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';

class HeroButton extends StatelessWidget {
  const HeroButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.primaryColor,
      textStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
      ),
      minimumSize: const Size(150, 40),
    );
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Row(
        children: [
          icon,
          Text(text),
        ],
      ),
    );
  }
}
