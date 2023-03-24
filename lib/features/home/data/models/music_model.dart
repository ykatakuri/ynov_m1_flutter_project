class Music {
  final String uid;
  final int userId;
  final String title;
  final String artist;
  final String url;

  Music(
      {required this.uid,
      required this.userId,
      required this.title,
      required this.artist,
      required this.url});

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      uid: json['id'],
      userId: json['userId'],
      title: json['title'],
      artist: json['artist'],
      url: json['url'],
    );
  }
}
