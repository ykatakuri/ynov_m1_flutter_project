import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/data/datasources/dump_data.dart';
import 'package:stopify/features/home/presentation/state/view_manager.dart';
import 'package:stopify/features/home/presentation/widgets/player_button.dart';
import 'package:text_helpers/text_helpers.dart';

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
    final mediaQuerySize = MediaQuery.of(context).size;
    final songContainerWidth = mediaQuerySize.width * 0.95;
    const double songContainerHeight = 220;
    const double coverContainerWidth = 150;
    const double coverContainerHeight = 150;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        title: const Text(Constants.appName),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: AppColors.secondaryColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: AppColors.primaryColor,
      ),
      body: ListView.separated(
        itemCount: playList.length,
        itemBuilder: (context, index) {
          return Container(
            width: songContainerWidth,
            height: songContainerHeight,
            margin: const EdgeInsets.only(
              left: 12,
              top: 16,
              right: 12,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryColor,
                  Colors.grey,
                ],
                transform: GradientRotation(10),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(playList[index].cover),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: coverContainerWidth,
                          height: coverContainerHeight,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Single',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              playList[index].title,
                              style: const TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            InlineText(
                              playList[index].artist,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white70,
                        ),
                        iconSize: 35,
                      ),
                      Expanded(child: Container()),
                      const Text(
                        '1 titre.s',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
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
                                child: const CircularProgressIndicator(
                                  color: AppColors.secondaryColor,
                                ),
                              );
                            case ButtonState.paused:
                              return PlayerButton(
                                iconData: Icons.play_circle_fill_rounded,
                                iconSize: 45,
                                onPressed: _viewManager.play,
                              );
                            case ButtonState.playing:
                              return PlayerButton(
                                iconData: Icons.pause_circle_outline_rounded,
                                iconSize: 45,
                                onPressed: _viewManager.pause,
                              );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }
}
