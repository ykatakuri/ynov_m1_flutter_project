import 'dart:async';

import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:stopify/features/search/domain/repositories/search_repository.dart';
import 'package:stopify/routing/app_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late List searchResults;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    searchResults = [];

    delaySearchResults();
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
          title: SearchBarAnimation(
            textEditingController: searchController,
            trailingWidget: const Icon(Icons.search),
            isOriginalAnimation: false,
            secondaryButtonWidget: const Icon(Icons.close),
            buttonWidget: const Icon(Icons.search),
            enableKeyboardFocus: true,
            onChanged: onSearch(),
            onFieldSubmitted: onSearch(),
          ),
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.black,
        ),
        body: searchResults.isEmpty
            ? const EmptyResult()
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
                            onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoute.trackPlayer.location,
                                  arguments: searchResults[index],
                                ));
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

class EmptyResult extends StatelessWidget {
  const EmptyResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Rechercher une musique',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
