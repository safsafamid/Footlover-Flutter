// To parse this JSON data, do
//
//     final player = playerFromMap(jsonString);

import 'dart:convert';

List<Player> playerFromMap(String str) =>
    List<Player>.from(json.decode(str).map((x) => Player.fromMap(x)));

String playerToMap(List<Player> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Player {
  int id;
  int teamId;
  int countryId;
  int leagueId;
  int positionId;
  String commonName;
  String shirtNumber;
  String slug;
  String displayName;
  String fullname;
  String firstname;
  String lastname;
  String nationality;
  String birthdate;
  dynamic birthcountry;
  dynamic birthplace;
  dynamic height;
  dynamic weight;
  String imagePath;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;

  Player({
    required this.id,
    required this.teamId,
    required this.countryId,
    required this.leagueId,
    required this.positionId,
    required this.commonName,
    required this.shirtNumber,
    required this.slug,
    required this.displayName,
    required this.fullname,
    required this.firstname,
    required this.lastname,
    required this.nationality,
    required this.birthdate,
    required this.birthcountry,
    required this.birthplace,
    required this.height,
    required this.weight,
    required this.imagePath,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Player.fromMap(Map<String, dynamic> json) {

    return Player(
        id: json["id"],
        teamId: json["team_id"],
        countryId: json["country_id"],
        leagueId: json["league_id"],
        positionId: json["position_id"],
        commonName: json["common_name"],
        shirtNumber: json["shirt_number"],
        slug: json["slug"],
        displayName: json["display_name"],
        fullname: json["fullname"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        nationality: json["nationality"],
        birthdate: json["birthdate"],
        birthcountry: json["birthcountry"],
        birthplace: json["birthplace"],
        height: json["height"],
        weight: json["weight"],
        imagePath: json["image_path"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "team_id": teamId,
        "country_id": countryId,
        "league_id": leagueId,
        "position_id": positionId,
        "common_name": commonName,
        "shirt_number": shirtNumber,
        "slug": slug,
        "display_name": displayName,
        "fullname": fullname,
        "firstname": firstname,
        "lastname": lastname,
        "nationality": nationality,
        "birthdate": birthdate,
        "birthcountry": birthcountry,
        "birthplace": birthplace,
        "height": height,
        "weight": weight,
        "image_path": imagePath,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
