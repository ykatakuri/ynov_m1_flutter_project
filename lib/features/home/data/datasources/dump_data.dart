import 'package:just_audio/just_audio.dart';
import 'package:stopify/features/home/data/models/music_model.dart';
import 'package:uuid/uuid.dart';

// Generate an unique id
var uuid = const Uuid();
var uid = uuid.v1();

const userId = 1;

const prefix = 'https://www.soundhelix.com/examples/mp3';

const song1 = '$prefix/SoundHelix-Song-1.mp3';
const song2 = '$prefix/SoundHelix-Song-2.mp3';
const song3 = '$prefix/SoundHelix-Song-3.mp3';
const song4 = '$prefix/SoundHelix-Song-4.mp3';
const song5 = '$prefix/SoundHelix-Song-5.mp3';
const song6 = '$prefix/SoundHelix-Song-6.mp3';
const song7 = '$prefix/SoundHelix-Song-7.mp3';
const song8 = '$prefix/SoundHelix-Song-8.mp3';
const song9 = '$prefix/SoundHelix-Song-9.mp3';
const song10 = '$prefix/SoundHelix-Song-10.mp3';
const song11 = '$prefix/SoundHelix-Song-11.mp3';
const song12 = '$prefix/SoundHelix-Song-12.mp3';
const song13 = '$prefix/SoundHelix-Song-13.mp3';
const song14 = '$prefix/SoundHelix-Song-14.mp3';
const song15 = '$prefix/SoundHelix-Song-15.mp3';
const song16 = '$prefix/SoundHelix-Song-16.mp3';
const song17 = '$prefix/SoundHelix-Song-17.mp3';
const song18 = '$prefix/SoundHelix-Song-18.mp3';
const song19 = '$prefix/SoundHelix-Song-19.mp3';
const song20 = '$prefix/SoundHelix-Song-20.mp3';

final audioSource1 = Uri.parse(song1);
final audioSource2 = Uri.parse(song2);
final audioSource3 = Uri.parse(song3);
final audioSource4 = Uri.parse(song4);
final audioSource5 = Uri.parse(song5);
final audioSource6 = Uri.parse(song6);
final audioSource7 = Uri.parse(song7);
final audioSource8 = Uri.parse(song8);
final audioSource9 = Uri.parse(song9);
final audioSource10 = Uri.parse(song10);
final audioSource11 = Uri.parse(song11);
final audioSource12 = Uri.parse(song12);
final audioSource13 = Uri.parse(song13);
final audioSource14 = Uri.parse(song14);
final audioSource15 = Uri.parse(song15);
final audioSource16 = Uri.parse(song16);
final audioSource17 = Uri.parse(song17);
final audioSource18 = Uri.parse(song18);
final audioSource19 = Uri.parse(song19);
final audioSource20 = Uri.parse(song20);

final playlist = ConcatenatingAudioSource(children: [
  AudioSource.uri(audioSource1, tag: 'Song One'),
  AudioSource.uri(audioSource2, tag: 'Song Two'),
  AudioSource.uri(audioSource3, tag: 'Song Three'),
  AudioSource.uri(audioSource4, tag: 'Song Four'),
  AudioSource.uri(audioSource5, tag: 'Song Five'),
  AudioSource.uri(audioSource6, tag: 'Song Six'),
  AudioSource.uri(audioSource7, tag: 'Song Seven'),
  AudioSource.uri(audioSource8, tag: 'Song Eight'),
  AudioSource.uri(audioSource9, tag: 'Song Nine'),
  AudioSource.uri(audioSource10, tag: 'Song Ten'),
  AudioSource.uri(audioSource11, tag: 'Song Eleven'),
  AudioSource.uri(audioSource12, tag: 'Song Twelve'),
  AudioSource.uri(audioSource13, tag: 'Song Thirteen'),
  AudioSource.uri(audioSource14, tag: 'Song Fourteen'),
  AudioSource.uri(audioSource15, tag: 'Song Fifteen'),
  AudioSource.uri(audioSource16, tag: 'Song Sixteen'),
  AudioSource.uri(audioSource17, tag: 'Song Seventeen'),
  AudioSource.uri(audioSource18, tag: 'Song Eighteen'),
  AudioSource.uri(audioSource19, tag: 'Song Nineteen'),
  AudioSource.uri(audioSource20, tag: 'Song Twenty'),
]);

List<Music> musics = [
  Music(
    uid: uid,
    userId: userId,
    title: 'Song One',
    artist: 'Artist One',
    url: song1,
    cover:
        'https://d1csarkz8obe9u.cloudfront.net/themedlandingpages/tlp_hero_album-cover-art-588174bffe0bcb491737d700db8e77df-1554161328.jpg',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Two',
    artist: 'Artist Two',
    url: song2,
    cover:
        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/eclipse-mixtape-cover-music-cd-design-template-b6bf8293632bce2ad98c1c4ab6752e1d_screen.jpg?ts=1571589565',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Three',
    artist: 'Artist Three',
    url: song3,
    cover:
        'https://media.istockphoto.com/id/660435634/fr/vectoriel/danse-musique-club-parti-vector-affiche-avec-disque-microsillon-de-mixage-dj.jpg?s=612x612&w=0&k=20&c=qPFyzINFppdoYB9hmNY_zjHRBY2-lVt5rYPi8nYoWZE=',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Four',
    artist: 'Artist Four',
    url: song4,
    cover:
        'https://images.template.net/wp-content/uploads/2022/06/Thriller-Album-Cover.jpg',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Five',
    artist: 'Artist Five',
    url: song5,
    cover:
        'https://www.designformusic.com/wp-content/uploads/2018/11/trailer-tension-album-cover-3d-design-1000x1000.jpg',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Six',
    artist: 'Artist Six',
    url: song6,
    cover:
        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/love-music-cd-music-cover-template-design-a8f2a1af7de0479ae4344113a4750136_screen.jpg?ts=1572382443',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Seven',
    artist: 'Artist Seven',
    url: song7,
    cover:
        'https://indiater.com/wp-content/uploads/2021/06/Free-Music-Album-Cover-Art-Banner-Photoshop-Template.jpg',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Eight',
    artist: 'Artist Eight',
    url: song8,
    cover:
        'https://d1wnwqwep8qkqc.cloudfront.net/uploads/stage/stage_image/21198/optimized_large_thumb_stage.jpg',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Nine',
    artist: 'Artist Nine',
    url: song9,
    cover:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Are_You_Experienced_-_US_cover-edit.jpg/640px-Are_You_Experienced_-_US_cover-edit.jpg',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Ten',
    artist: 'Artist Ten',
    url: song10,
    cover:
        'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/c516f191023435.5e270367679f1.png',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Eleven',
    artist: 'Artist Eleven',
    url: song11,
    cover:
        'https://thumbs.dreamstime.com/b/dynamic-radial-color-sound-equalizer-design-music-album-cover-template-abstract-circular-digital-data-form-vector-160916775.jpg',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Twelve',
    artist: 'Artist Twelve',
    url: song12,
    cover:
        'https://img.freepik.com/psd-premium/modele-conception-banniere-effet-texte-photo-special-psd-premium_567320-98.jpg?w=2000',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Thirteen',
    artist: 'Artist Thirteen',
    url: song13,
    cover:
        'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/Guide-to-Album-Covers.jpg?auto=format&q=60&w=2060&h=2060&fit=crop&crop=faces',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Fourteen',
    artist: 'Artist Fourteen',
    url: song14,
    cover:
        'https://cms-assets.tutsplus.com/cdn-cgi/image/width=850/uploads/users/114/posts/34296/final_image/Final-image.jpg',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Fifteen',
    artist: 'Artist Fifteen',
    url: song15,
    cover:
        'https://media.istockphoto.com/id/1127565686/photo/vintage-vinyl-record-album-cover-mockup-flat-concept.jpg?s=170667a&w=0&k=20&c=xOeWcvRRigZgbLB7QiHUPqwEpez8DHf_HvNzvHvu-zo=',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Sixteen',
    artist: 'Artist Sixteen',
    url: song16,
    cover:
        'https://play-lh.googleusercontent.com/vfPYnPDLvWa09WqmJ4fPhiklOQmGBYIGPeqPwaorTvyQqAbZw6mH7hHw3VpF0TF-qe8',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Seventeen',
    artist: 'Artist Seventeen',
    url: song17,
    cover:
        'https://cdn.dribbble.com/users/372/screenshots/15518063/media/2a94790f4d1213b8e044b0fe061c7d34.jpg?compress=1&resize=400x300',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Eighteen',
    artist: 'Artist Eighteen',
    url: song18,
    cover:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxFPly1gWM_zdPZO0loSBi8PZCnyDHmlBiaA&usqp=CAU',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Nineteen',
    artist: 'Artist Nineteen',
    url: song19,
    cover:
        'https://www.adobe.com/fr/express/create/cover/media_1607d76a0ca6bf36bfa8895499839c37736d7f671.png?width=400&format=png&optimize=medium',
  ),
  Music(
    uid: uid,
    userId: userId,
    title: 'Song Twenty',
    artist: 'Artist Twenty',
    url: song20,
    cover:
        'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/122288006/original/7ec0aed464ab3452bc42dd45dcd87187adbb01c7/creative-coverart-for-your-song-or-album.jpg',
  ),
];
