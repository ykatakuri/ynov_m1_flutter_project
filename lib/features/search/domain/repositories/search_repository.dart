import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stopify/constants/constants.dart';
import 'package:stopify/shared/data/models/music_model.dart';

class SearchRepository {
  static Future<List<Music>> searchTrack(String search) async {
    final response = await http.get(
      Uri.parse(
          '${Constants.apiBaseUrl}/tracks/?client_id=${Constants.clientId}&format=jsonpretty&limit=20&search=$search&audioformat=mp32'),
    );

    if (response.statusCode == 200) {
      final List<Music> tracks = [];
      final json = jsonDecode(response.body);
      final data = json['results'] as List;

      for (var track in data) {
        tracks.add(Music.fromJson(track));
      }

      return tracks;
    } else {
      throw Exception('Failed to load musics');
    }
  }
}
