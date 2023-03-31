import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/presentation/screens/home_view.dart';
import 'package:stopify/features/home/presentation/widgets/custom_bottom_tab_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
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
