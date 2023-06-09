import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:tuple/tuple.dart';

const prefix = 'https://www.soundhelix.com/examples/mp3';

List<Tuple2<String, String>> generateSongsList() {
  return List<Tuple2<String, String>>.generate(20, (index) {
    int songNumber = index + 1;
    String songUrl = '$prefix/SoundHelix-Song-$songNumber.mp3';
    String songTitle = 'SoundHelix-Song $songNumber';
    return Tuple2<String, String>(songUrl, songTitle);
  });
}

final songsList = generateSongsList();

final playlist = ConcatenatingAudioSource(
  children: [
    for (var song in songsList)
      AudioSource.uri(
        Uri.parse(song.item1),
        tag: MediaItem(
          id: song.item1,
          title: song.item2,
          album: song.item1,
        ),
      ),
  ],
);
