class Music {
  final String uid;
  final int userId;
  final String title;
  final String artist;
  final String url;
  final String cover;

  Music({
    required this.uid,
    required this.userId,
    required this.title,
    required this.artist,
    required this.url,
    required this.cover,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      uid: json['id'],
      userId: json['userId'],
      title: json['title'],
      artist: json['artist'],
      url: json['url'],
      cover: json['cover'],
    );
  }
}
