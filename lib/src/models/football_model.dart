// To parse this JSON data, do
//
//     final footballModel = footballModelFromJson(jsonString);

import 'dart:convert';

FootballModel footballModelFromJson(String str) => FootballModel.fromJson(json.decode(str));

String footballModelToJson(FootballModel data) => json.encode(data.toJson());

class FootballModel {
    int success;
    List<Result> result;

    FootballModel({
        required this.success,
        required this.result,
    });

    factory FootballModel.fromJson(Map<String, dynamic> json) => FootballModel(
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
    String countryName;
    String? leagueLogo;
    String? countryLogo;

    Result({
        required this.leagueKey,
        required this.leagueName,
        required this.countryKey,
        required this.countryName,
        required this.leagueLogo,
        required this.countryLogo,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        leagueKey: json["league_key"],
        leagueName: json["league_name"],
        countryKey: json["country_key"],
        countryName: json["country_name"],
        leagueLogo: json["league_logo"],
        countryLogo: json["country_logo"],
    );

    Map<String, dynamic> toJson() => {
        "league_key": leagueKey,
        "league_name": leagueName,
        "country_key": countryKey,
        "country_name": countryName,
        "league_logo": leagueLogo,
        "country_logo": countryLogo,
    };
}
