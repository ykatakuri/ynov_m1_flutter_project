class Music {
  String? id;
  String? name;
  int? duration;
  String? artistId;
  String? artistName;
  String? artistIdstr;
  String? albumName;
  String? albumId;
  String? licenseCcurl;
  int? position;
  String? releasedate;
  String? albumImage;
  String? audio;
  String? audiodownload;
  String? prourl;
  String? shorturl;
  String? shareurl;
  String? waveform;
  String? image;
  bool? audiodownloadAllowed;

  Music(
      {this.id,
      this.name,
      this.duration,
      this.artistId,
      this.artistName,
      this.artistIdstr,
      this.albumName,
      this.albumId,
      this.licenseCcurl,
      this.position,
      this.releasedate,
      this.albumImage,
      this.audio,
      this.audiodownload,
      this.prourl,
      this.shorturl,
      this.shareurl,
      this.waveform,
      this.image,
      this.audiodownloadAllowed});

  Music.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    artistIdstr = json['artist_idstr'];
    albumName = json['album_name'];
    albumId = json['album_id'];
    licenseCcurl = json['license_ccurl'];
    position = json['position'];
    releasedate = json['releasedate'];
    albumImage = json['album_image'];
    audio = json['audio'];
    audiodownload = json['audiodownload'];
    prourl = json['prourl'];
    shorturl = json['shorturl'];
    shareurl = json['shareurl'];
    waveform = json['waveform'];
    image = json['image'];
    audiodownloadAllowed = json['audiodownload_allowed'];
  }
}
