import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/features/home/data/datasources/dump_data.dart';
import 'package:stopify/features/home/presentation/state/view_manager.dart';

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
      body: ListView.separated(
        itemCount: playList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(
              playList[index].title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(playList[index].artist),
            trailing: IconButton(
                icon: const Icon(
                  Icons.download_for_offline,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {}),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 3),
      ),
    );
  }
}
