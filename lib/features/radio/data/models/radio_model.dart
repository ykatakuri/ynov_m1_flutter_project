class RadioMetadata {
  final int? id;
  final String? slug;
  final String? name;
  final String? slogan;
  final String? lang;
  final String? status;
  final String? streamStatus;
  final bool? isPublic;
  final String? logo;
  final String? defaultCover;
  final String? website;
  final String? facebookKey;
  final String? itunesAffiliateId;

  RadioMetadata({
    this.id,
    this.slug,
    this.name,
    this.slogan,
    this.lang,
    this.status,
    this.streamStatus,
    this.isPublic,
    this.logo,
    this.defaultCover,
    this.website,
    this.facebookKey,
    this.itunesAffiliateId,
  });

  factory RadioMetadata.fromJson(Map<String, dynamic> json) {
    return RadioMetadata(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      slogan: json['slogan'],
      lang: json['lang'],
      status: json['status'],
      streamStatus: json['stream_status'],
      isPublic: json['is_public'],
      logo: json['logo'],
      defaultCover: json['default_cover'],
      website: json['website'],
      facebookKey: json['facebook_key'],
      itunesAffiliateId: json['itunes_affiliate_id'],
    );
  }
}
