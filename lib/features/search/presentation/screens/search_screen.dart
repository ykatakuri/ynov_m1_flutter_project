import 'dart:async';

import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/search/domain/repositories/search_repository.dart';
import 'package:stopify/features/search/presentation/screens/widgets/search_player_progress_bar.dart';
import 'package:stopify/features/search/presentation/screens/widgets/search_track_player_button.dart';
import 'package:stopify/features/search/presentation/state/search_track_manager.dart';
import 'package:stopify/shared/presentation/screens/widgets/album_image_container.dart';
import 'package:stopify/shared/presentation/widgets/empty_result.dart';
import 'package:text_scroll/text_scroll.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late List searchResults;
  bool isLoading = true;

  late SearchTrackManager trackManager;

  late String audioUrl;

  @override
  void initState() {
    super.initState();

    audioUrl = Constants.defaultUrl;

    searchResults = [];

    delaySearchResults();
  }

  @override
  void dispose() {
    trackManager.dispose();
    super.dispose();
  }

  Timer delaySearchResults() {
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
          title: const Text(Constants.searchText),
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.black,
          actions: [
            SearchBarAnimation(
              textEditingController: searchController,
              hintText: 'Artistes, morceaux, paroles, etc.',
              trailingWidget: const Icon(Icons.search),
              isOriginalAnimation: false,
              secondaryButtonWidget: const Icon(Icons.close),
              buttonWidget: const Icon(Icons.search),
              enableKeyboardFocus: false,
              searchBoxWidth: 350,
              onChanged: onSearch(),
              onFieldSubmitted: onSearch(),
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        ),
        body: searchResults.isEmpty
            ? const EmptyResult(text: 'Rechercher une musique')
            : isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.separated(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        audioUrl = searchResults[index].audio;

                        return GestureDetector(
                          child: ListTile(
                            title: Text(
                              searchResults[index].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              '${searchResults[index].albumName} . ${searchResults[index].artistName}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            leading: Image.network(
                              searchResults[index].albumImage,
                              width: 50,
                              height: 50,
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white70,
                            ),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: true,
                                builder: (context) {
                                  trackManager =
                                      SearchTrackManager(url: audioUrl);

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
                                          AlbumImageContainer(
                                            albumImage:
                                                searchResults[index].image ??
                                                    Constants.coverURL,
                                          ),
                                          const SizedBox(height: 50),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 32.0),
                                            child: TextScroll(
                                              searchResults[index].name ??
                                                  'Title',
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
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 32.0),
                                            child: Text(
                                              searchResults[index].artistName ??
                                                  'Artist',
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SearchPlayerProgressBar(
                                              trackManager: trackManager),
                                          const SizedBox(height: 20),
                                          SearchTrackPlayerButton(
                                              trackManager: trackManager),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Divider(
                            color: Colors.white70,
                            thickness: 1,
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }

  Function onSearch() {
    return ((String value) {
      if (value.isNotEmpty) {
        SearchRepository.searchTrack(value).then((value) {
          setState(() {
            searchResults = value;
          });
        });
      } else {
        setState(() {
          searchResults = [];
        });
      }
    });
  }
}
