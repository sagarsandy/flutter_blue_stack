class Tournament {
  final String name;
  final String coverUrl;
  final String gameName;

  Tournament({
    this.name,
    this.coverUrl,
    this.gameName,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      name: json["name"] as String,
      coverUrl: json["cover_url"] as String,
      gameName: json["game_name"] as String,
    );
  }
}
