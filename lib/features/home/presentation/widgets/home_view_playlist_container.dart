import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/features/home/data/datasources/dump_data.dart';

class PlayListContainer extends StatelessWidget {
  const PlayListContainer({
    super.key,
    required this.mediaQuerySize,
  });

  final Size mediaQuerySize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQuerySize.height / 2,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
            title: Text(
              musics[index].title,
              style: const TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 14,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.download),
              color: Colors.white70,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(left: 32),
            child: Divider(
              height: 1,
              color: Colors.white70,
            ),
          );
        },
        itemCount: musics.length,
      ),
    );
  }
}