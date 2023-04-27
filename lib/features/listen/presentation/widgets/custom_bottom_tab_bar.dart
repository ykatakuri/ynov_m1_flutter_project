import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';

class CustomBottomTabBar extends StatelessWidget {
  const CustomBottomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.play_circle,
              size: Constants.tabBarIconSize,
            ),
            text: Constants.listenText,
          ),
          Tab(
            icon: Icon(
              Icons.sensors,
              size: Constants.tabBarIconSize,
            ),
            text: Constants.radioText,
          ),
          Tab(
            icon: Icon(
              Icons.library_music,
              size: Constants.tabBarIconSize,
            ),
            text: Constants.libraryText,
          ),
          Tab(
            icon: Icon(
              Icons.search,
              size: Constants.tabBarIconSize,
            ),
            text: Constants.searchText,
          ),
        ],
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.white,
        labelStyle: TextStyle(fontSize: Constants.labelFontSize),
        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }
}
