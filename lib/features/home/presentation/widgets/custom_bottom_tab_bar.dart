import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';

class CustomBottomTabBar extends StatelessWidget {
  const CustomBottomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.primaryColor,
      child: TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.home,
              size: Constants.tabBarIconSize,
            ),
            text: Constants.homeText,
          ),
          Tab(
            icon: Icon(
              Icons.search,
              size: Constants.tabBarIconSize,
            ),
            text: Constants.searchText,
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
              Icons.live_tv,
              size: Constants.tabBarIconSize,
            ),
            text: Constants.liveText,
          ),
        ],
        labelColor: AppColors.secondaryColor,
        unselectedLabelColor: Colors.grey,
        indicatorColor: AppColors.secondaryColor,
        labelStyle: TextStyle(fontSize: Constants.labelFontSize),
        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }
}
