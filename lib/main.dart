import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/home/presentation/screens/home_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const DefaultTabController(
        length: Constants.tabBarLength,
        child: HomeScreen(),
      ),
    );
  }
}
