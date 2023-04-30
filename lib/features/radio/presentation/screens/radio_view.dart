import 'package:flutter/material.dart';
import 'package:stopify/constants/constants.dart';
import 'package:stopify/features/radio/data/models/radio_model.dart';
import 'package:stopify/features/radio/domain/repositories/radio_repository.dart';
import 'package:stopify/routing/app_router.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  late Future<RadioMetadata> futureRadioMetadata;

  @override
  void initState() {
    super.initState();

    futureRadioMetadata = fetchRadioMetadata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        title: const Text(Constants.radioText),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.black,
      ),
      body: RadioItem(futureRadioMetadata: futureRadioMetadata),
    );
  }
}

class RadioItem extends StatelessWidget {
  const RadioItem({
    super.key,
    required this.futureRadioMetadata,
  });

  final Future<RadioMetadata> futureRadioMetadata;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioMetadata>(
      future: futureRadioMetadata,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return Item(data: data);
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
      },
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.data,
  });

  final RadioMetadata? data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 300,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(data?.logo ?? Constants.coverURL),
            fit: BoxFit.cover,
          ),
        ),
        child: MetadataContainer(data: data),
      ),
      onTap: () => Navigator.pushNamed(
        context,
        AppRoute.radioPlayer.location,
        arguments: data?.name ?? 'Radio name',
      ),
    );
  }
}

class MetadataContainer extends StatelessWidget {
  const MetadataContainer({
    super.key,
    required this.data,
  });

  final RadioMetadata? data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            width: 390,
            height: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data?.website ?? 'website',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          data?.name ?? 'name',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          data?.slogan ?? 'slogan',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  width: 110,
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
