import 'package:flutter/material.dart';

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
