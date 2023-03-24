import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: Constants.stackPlayerBottom,
            left: 4,
            child: Card(
              elevation: Constants.playerElevation,
              color: AppColors.primaryColor,
              shadowColor: AppColors.shadowColor,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      iconSize: Constants.previousAndNextIconSize,
                      color: AppColors.secondaryColor,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.play_circle_fill_rounded),
                      iconSize: Constants.playIconSize,
                      color: AppColors.secondaryColor,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      iconSize: Constants.previousAndNextIconSize,
                      color: AppColors.secondaryColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text(
                    'My song title',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Artist name'),
                  trailing: Icon(Icons.play_arrow),
                ),
                Divider(thickness: 3),
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text(
                    'My song title',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Artist name'),
                  trailing: Icon(Icons.play_arrow),
                ),
                Divider(thickness: 3),
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text(
                    'My song title',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Artist name'),
                  trailing: Icon(Icons.play_arrow),
                ),
                Divider(thickness: 3),
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text(
                    'My song title',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Artist name'),
                  trailing: Icon(Icons.play_arrow),
                ),
                Divider(thickness: 3),
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text(
                    'My song title',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('Artist name'),
                  trailing: Icon(Icons.play_arrow),
                ),
                Divider(thickness: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
