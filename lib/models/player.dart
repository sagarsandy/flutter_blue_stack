class Player {
  String name;
  String image;
  String played;
  String won;
  String winPercentage;
  String points;

  Player({
    this.name,
    this.image,
    this.played,
    this.won,
    this.winPercentage,
    this.points,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json["name"] as String,
      image: json["image"] as String,
      played: json["played"].toString(),
      won: json["won"].toString(),
      winPercentage: json["win_percent"].toString(),
      points: json["points"].toString(),
    );
  }
}
