import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/library/presentation/state/library_manager.dart';
import 'package:stopify/features/library/presentation/widget/library_player_button.dart';
import 'package:stopify/features/library/presentation/widget/library_player_progress_bar.dart';
import 'package:stopify/shared/presentation/screens/widgets/album_image_container.dart';
import 'package:stopify/shared/presentation/widgets/empty_result.dart';
import 'package:text_scroll/text_scroll.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool isLoading = true;

  List<dynamic> downloadedSongs = [];

  late LibraryManager libraryManager;

  late String filePath;
  late String filename;

  @override
  void initState() {
    super.initState();

    filePath = '';
    filename = '';

    delayDisplaying();
    getDownloadedFiles();
  }

  @override
  void dispose() {
    libraryManager.dispose();
    super.dispose();
  }

  Future<void> getDownloadedFiles() async {
    Directory? directory = await getApplicationDocumentsDirectory();
    setState(() {
      downloadedSongs = directory
          .listSync()
          .where((file) => file.path.endsWith('.mp3'))
          .toList();
    });
  }

  Timer delayDisplaying() {
    return Timer(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: false,
          leadingWidth: 0,
          title: const Text(Constants.libraryText),
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.black,
        ),
        body: downloadedSongs.isEmpty
            ? const EmptyResult(text: 'Aucune musique disponible')
            : isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      itemCount: downloadedSongs.length,
                      itemBuilder: (context, index) {
                        filename = downloadedSongs[index]!.path.split('/').last;

                        filePath = downloadedSongs[index]!.path;

                        return GestureDetector(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  filename,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white70,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Divider(
                                  color: Colors.white70,
                                  thickness: 1,
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: true,
                                builder: (context) {
                                  libraryManager =
                                      LibraryManager(path: filePath);

                                  return Container(
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const AlbumImageContainer(
                                            albumImage: Constants.coverURL,
                                          ),
                                          const SizedBox(height: 50),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 32.0),
                                            child: TextScroll(
                                              filename,
                                              mode: TextScrollMode.endless,
                                              velocity: const Velocity(
                                                  pixelsPerSecond:
                                                      Offset(40, 0)),
                                              delayBefore: const Duration(
                                                  milliseconds: 500),
                                              pauseBetween: const Duration(
                                                  milliseconds: 50),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.right,
                                              selectable: false,
                                            ),
                                          ),
                                          LibraryPlayerProgressBar(
                                            libraryManager: libraryManager,
                                          ),
                                          const SizedBox(height: 20),
                                          LibraryPlayerButton(
                                            libraryManager: libraryManager,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
