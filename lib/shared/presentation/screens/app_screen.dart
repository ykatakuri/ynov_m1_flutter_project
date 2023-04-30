import 'package:flutter/material.dart';
import 'package:stopify/features/library/presentation/screens/library_screen.dart';
import 'package:stopify/features/listen/presentation/screens/listen_view.dart';
import 'package:stopify/features/listen/presentation/widgets/custom_bottom_tab_bar.dart';
import 'package:stopify/features/radio/presentation/screens/radio_view.dart';
import 'package:stopify/features/search/presentation/screens/search_screen.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: TabBarView(
        children: [
          ListenView(),
          RadioView(),
          LibraryScreen(),
          SearchScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomTabBar(),
    );
  }
}
