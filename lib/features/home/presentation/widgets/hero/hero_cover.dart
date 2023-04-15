import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';

class HeroCover extends StatelessWidget {
  const HeroCover({
    super.key,
    required this.coverContainerWidth,
    required this.coverContainerHeight,
  });

  final double coverContainerWidth;
  final double coverContainerHeight;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: Constants.coverURL,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        width: coverContainerWidth,
        height: coverContainerHeight,
      ),
      placeholder: (context, url) => SizedBox(
        width: coverContainerWidth,
        height: coverContainerHeight,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
        width: coverContainerWidth,
        height: coverContainerHeight,
        child: const Icon(Icons.error),
      ),
    );
  }
}
