// To parse this JSON data, do
//
//     final league = leagueFromMap(jsonString);

import 'dart:convert';

List<League> leagueFromMap(String str) => List<League>.from(json.decode(str).map((x) => League.fromMap(x)));

String leagueToMap(List<League> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class League {
    int id;
    String name;
    String slug;
    String shortCode;
    String imagePath;
    dynamic legacyId;
    int countryId;
    dynamic isCup;
    dynamic active;
    dynamic type;
    dynamic logoPath;
    dynamic deletedAt;
    dynamic createdAt;
    dynamic updatedAt;

    League({
        required this.id,
        required this.name,
        required this.slug,
        required this.shortCode,
        required this.imagePath,
        required this.legacyId,
        required this.countryId,
        this.isCup,
        this.active,
        this.type,
        this.logoPath,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory League.fromMap(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        shortCode: json["short_code"],
        imagePath: json["image_path"],
        legacyId: json["legacy_id"],
        countryId: json["country_id"],
        isCup: json["is_cup"],
        active: json["active"],
        type: json["type"],
        logoPath: json["logo_path"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "short_code": shortCode,
        "image_path": imagePath,
        "legacy_id": legacyId,
        "country_id": countryId,
        "is_cup": isCup,
        "active": active,
        "type": type,
        "logo_path": logoPath,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
