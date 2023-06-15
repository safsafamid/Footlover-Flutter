// To parse this JSON data, do
//
//     final team = teamFromMap(jsonString);

import 'dart:convert';

List<Team> teamFromMap(String str) => List<Team>.from(json.decode(str).map((x) => Team.fromMap(x)));

String teamToMap(List<Team> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Team {
    int id;
    dynamic legacyId;
    int countryId;
    int stadiumId;
    int leagueId;
    String slug;
    String name;
    String shortCode;
    String displayName;
    String manager;
    String founded;
    String logoPath;
    dynamic currentSeasonId;
    dynamic deletedAt;
    dynamic createdAt;
    dynamic updatedAt;

    Team({
        required this.id,
        required this.legacyId,
        required this.countryId,
        required this.stadiumId,
        required this.leagueId,
        required this.slug,
        required this.name,
        required this.shortCode,
        required this.displayName,
        required this.manager,
        required this.founded,
        required this.logoPath,
        this.currentSeasonId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Team.fromMap(Map<String, dynamic> json) => Team(
        id: json["id"],
        legacyId: json["legacy_id"],
        countryId: json["country_id"],
        stadiumId: json["stadium_id"],
        leagueId: json["league_id"],
        slug: json["slug"],
        name: json["name"],
        displayName: json["display_name"],
        shortCode: json["short_code"],
        manager: json["manager"],
        founded: json["founded"],
        logoPath: json["logo_path"],
        currentSeasonId: json["current_season_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "legacy_id": legacyId,
        "country_id": countryId,
        "stadium_id": stadiumId,
        "league_id": leagueId,
        "slug": slug,
        "name": name,
        "short_code": shortCode,
        "manager": manager,
        "founded": founded,
        "logo_path": logoPath,
        "current_season_id": currentSeasonId,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
