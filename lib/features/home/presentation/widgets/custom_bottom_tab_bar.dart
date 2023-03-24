import 'package:flutter/material.dart';

class CustomBottomTabBar extends StatelessWidget {
  const CustomBottomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      child: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.search),
          ),
          Tab(
            icon: Icon(Icons.library_music),
          ),
          Tab(
            icon: Icon(Icons.person),
          ),
        ],
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }
}
