import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/presentation/screens/home_view.dart';
import 'package:stopify/features/home/presentation/widgets/custom_bottom_tab_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        title: const Text(Constants.appName),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: AppColors.secondaryColor,
      ),
      body: const TabBarView(
        children: [
          HomeView(),
          Icon(Icons.search),
          Icon(Icons.library_music),
        ],
      ),
      bottomNavigationBar: const CustomBottomTabBar(),
    );
  }
}
