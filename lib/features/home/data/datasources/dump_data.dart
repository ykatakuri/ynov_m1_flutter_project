import 'package:stopify/features/home/data/models/music_model.dart';
import 'package:uuid/uuid.dart';

// Generate an unique id
var uuid = const Uuid();
var uid = uuid.v1();

const userId = 1;

List<Music> playList = [
  Music(
    uid: uid,
    userId: userId,
    title: 'Song One',
    artist: 'Artist One',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Two',
    artist: 'Artist Two',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Three',
    artist: 'Artist Three',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Four',
    artist: 'Artist Four',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Five',
    artist: 'Artist Five',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Six',
    artist: 'Artist Six',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Seven',
    artist: 'Artist Seven',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Eight',
    artist: 'Artist Eight',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Nine',
    artist: 'Artist Nine',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Ten',
    artist: 'Artist Ten',
    url: 'https://listen.radioking.com/radio/242578/stream/286663',
  ),
];
