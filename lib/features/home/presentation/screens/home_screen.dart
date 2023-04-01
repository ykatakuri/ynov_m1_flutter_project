import 'package:flutter/material.dart';
import 'package:stopify/constants/app_colors.dart';
import 'package:stopify/features/home/presentation/screens/home_view.dart';
import 'package:stopify/features/home/presentation/widgets/custom_bottom_tab_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: TabBarView(
        children: [
          HomeView(),
          Icon(Icons.search),
          Icon(Icons.library_music),
          Icon(Icons.live_tv),
        ],
      ),
      bottomNavigationBar: CustomBottomTabBar(),
    );
  }
}
