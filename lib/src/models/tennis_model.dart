// To parse this JSON data, do
//
//     final tennisModel = tennisModelFromJson(jsonString);

import 'dart:convert';

TennisModel tennisModelFromJson(String str) => TennisModel.fromJson(json.decode(str));

String tennisModelToJson(TennisModel data) => json.encode(data.toJson());

class TennisModel {
    int success;
    List<Result> result;

    TennisModel({
        required this.success,
        required this.result,
    });

    factory TennisModel.fromJson(Map<String, dynamic> json) => TennisModel(
        success: json["success"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    int leagueKey;
    String leagueName;
    int countryKey;
    CountryName countryName;

    Result({
        required this.leagueKey,
        required this.leagueName,
        required this.countryKey,
        required this.countryName,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        leagueKey: json["league_key"],
        leagueName: json["league_name"],
        countryKey: json["country_key"],
        countryName: countryNameValues.map[json["country_name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "league_key": leagueKey,
        "league_name": leagueName,
        "country_key": countryKey,
        "country_name": countryNameValues.reverse[countryName],
    };
}

enum CountryName {
    ATP_DOUBLES,
    ATP_SINGLES,
    BOYS_DOUBLES,
    BOYS_SINGLES,
    CHALLENGER_MEN_DOUBLES,
    CHALLENGER_MEN_SINGLES,
    CHALLENGER_WOMEN_DOUBLES,
    CHALLENGER_WOMEN_SINGLES,
    EXHIBITION_DOUBLES_MEN,
    EXHIBITION_DOUBLES_WOMEN,
    EXHIBITION_MEN,
    EXHIBITION_MIXED_DOUBLES,
    EXHIBITION_TEAMS,
    EXHIBITION_WOMEN,
    GIRLS_DOUBLES,
    GIRLS_SINGLES,
    ITF_MEN_DOUBLES,
    ITF_MEN_SINGLES,
    ITF_WOMEN_DOUBLES,
    ITF_WOMEN_SINGLES,
    MIXED_DOUBLES,
    TEAMS_MEN,
    TEAMS_MIX,
    TEAMS_WOMEN,
    WTA_DOUBLES,
    WTA_SINGLES
}

final countryNameValues = EnumValues({
    "Atp Doubles": CountryName.ATP_DOUBLES,
    "Atp Singles": CountryName.ATP_SINGLES,
    "Boys Doubles": CountryName.BOYS_DOUBLES,
    "Boys Singles": CountryName.BOYS_SINGLES,
    "Challenger Men Doubles": CountryName.CHALLENGER_MEN_DOUBLES,
    "Challenger Men Singles": CountryName.CHALLENGER_MEN_SINGLES,
    "Challenger Women Doubles": CountryName.CHALLENGER_WOMEN_DOUBLES,
    "Challenger Women Singles": CountryName.CHALLENGER_WOMEN_SINGLES,
    "Exhibition Doubles Men": CountryName.EXHIBITION_DOUBLES_MEN,
    "Exhibition Doubles Women": CountryName.EXHIBITION_DOUBLES_WOMEN,
    "Exhibition Men": CountryName.EXHIBITION_MEN,
    "Exhibition Mixed Doubles": CountryName.EXHIBITION_MIXED_DOUBLES,
    "Exhibition Teams": CountryName.EXHIBITION_TEAMS,
    "Exhibition Women": CountryName.EXHIBITION_WOMEN,
    "Girls Doubles": CountryName.GIRLS_DOUBLES,
    "Girls Singles": CountryName.GIRLS_SINGLES,
    "Itf Men Doubles": CountryName.ITF_MEN_DOUBLES,
    "Itf Men Singles": CountryName.ITF_MEN_SINGLES,
    "Itf Women Doubles": CountryName.ITF_WOMEN_DOUBLES,
    "Itf Women Singles": CountryName.ITF_WOMEN_SINGLES,
    "Mixed Doubles": CountryName.MIXED_DOUBLES,
    "Teams Men": CountryName.TEAMS_MEN,
    "Teams Mix": CountryName.TEAMS_MIX,
    "Teams Women": CountryName.TEAMS_WOMEN,
    "Wta Doubles": CountryName.WTA_DOUBLES,
    "Wta Singles": CountryName.WTA_SINGLES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
