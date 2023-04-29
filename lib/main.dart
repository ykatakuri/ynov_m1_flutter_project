import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/radio/presentation/screens/radio_player.dart';
import 'package:stopify/routing/app_router.dart';
import 'package:stopify/shared/presentation/screens/app_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      routes: {
        AppRoute.radioPlayer.location: (context) => const RadioPlayer(),
      },
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
