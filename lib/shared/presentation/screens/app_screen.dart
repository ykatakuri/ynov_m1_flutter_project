import 'package:flutter/material.dart';
import 'package:stopify/features/listen/presentation/screens/listen_view.dart';
import 'package:stopify/features/listen/presentation/widgets/custom_bottom_tab_bar.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: TabBarView(
        children: [
          ListenView(),
          Icon(Icons.sensors),
          Icon(Icons.library_music),
          Icon(Icons.search),
        ],
      ),
      bottomNavigationBar: CustomBottomTabBar(),
    );
  }
}
