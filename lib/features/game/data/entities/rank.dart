import 'dart:convert';

Rank rankFromJson(String str) {
  final jsonData = json.decode(str);
  return Rank.fromJson(jsonData);
}

class Rank {
  int rank;

  Rank({
    required this.rank,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        rank: json["rank"],
      );
}
