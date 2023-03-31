import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/data/datasources/dump_data.dart';

class PlayList extends StatelessWidget {
  const PlayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.playlistBoxHeight,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        itemCount: playList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(
              playList[index].title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(playList[index].artist),
            trailing:
                IconButton(icon: const Icon(Icons.download), onPressed: () {}),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 3),
      ),
    );
  }
}
