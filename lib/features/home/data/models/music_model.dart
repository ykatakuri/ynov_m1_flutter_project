class Music {
  final String uid;
  final String userId;
  final String title;
  final String artist;

  Music({
    required this.uid,
    required this.userId,
    required this.title,
    required this.artist,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      uid: json['id'],
      userId: json['userId'],
      title: json['title'],
      artist: json['artist'],
    );
  }
}
