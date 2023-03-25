import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 300,
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
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 3),
              ),
            ),
            const Spacer(),
            Card(
              elevation: Constants.playerElevation,
              color: AppColors.primaryColor,
              shadowColor: AppColors.shadowColor,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: ValueListenableBuilder<ProgressBarState>(
                        valueListenable: _viewManager.progressNotifier,
                        builder: (_, value, __) {
                          return ProgressBar(
                            progress: value.current,
                            total: value.total,
                            buffered: value.buffered,
                            baseBarColor: AppColors.secondaryColor,
                            progressBarColor: Colors.amber,
                            thumbColor: Colors.amber,
                            timeLabelTextStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.skip_previous),
                          iconSize: Constants.previousAndNextIconSize,
                          color: AppColors.secondaryColor,
                          onPressed: () {},
                        ),
                        ValueListenableBuilder<ButtonState>(
                          valueListenable: _viewManager.buttonNotifier,
                          builder: (_, value, __) {
                            switch (value) {
                              case ButtonState.loading:
                                return Container(
                                  margin: const EdgeInsets.all(8.0),
                                  width: 32.0,
                                  height: 32.0,
                                  child: const CircularProgressIndicator(),
                                );
                              case ButtonState.paused:
                                return IconButton(
                                  icon: const Icon(
                                      Icons.play_circle_fill_rounded),
                                  iconSize: Constants.playIconSize,
                                  color: AppColors.secondaryColor,
                                  onPressed: _viewManager.play,
                                );
                              case ButtonState.playing:
                                return IconButton(
                                  icon: const Icon(Icons.pause),
                                  iconSize: Constants.playIconSize,
                                  color: AppColors.secondaryColor,
                                  onPressed: _viewManager.pause,
                                );
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next),
                          iconSize: Constants.previousAndNextIconSize,
                          color: AppColors.secondaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
