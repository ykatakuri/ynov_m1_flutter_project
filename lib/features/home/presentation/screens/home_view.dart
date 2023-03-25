import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/data/datasources/dump_data.dart';
import 'package:stopify/features/home/presentation/state/view_manager.dart';
import 'package:stopify/features/home/presentation/widgets/custom_player.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ViewManager _viewManager;

  @override
  void initState() {
    _viewManager = ViewManager();
    super.initState();
  }

  @override
  void dispose() {
    _viewManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PlayList(),
            const Spacer(),
            CustomPlayer(viewManager: _viewManager),
          ],
        ),
      ),
    );
  }
}

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
            trailing: const Icon(Icons.play_arrow),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 3),
      ),
    );
  }
}
