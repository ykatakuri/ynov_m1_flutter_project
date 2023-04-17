import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/shared/presentation/screens/app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primaryColor: Colors.black,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black.withOpacity(0.7),
        ),
      ),
      home: const DefaultTabController(
        length: Constants.tabBarLength,
        child: AppScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
