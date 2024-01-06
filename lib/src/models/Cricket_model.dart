// To parse this JSON data, do
//
//     final cricketModel = cricketModelFromJson(jsonString);

import 'dart:convert';

CricketModel cricketModelFromJson(String str) => CricketModel.fromJson(json.decode(str));

String cricketModelToJson(CricketModel data) => json.encode(data.toJson());

class CricketModel {
    int success;
    List<Result> result;

    CricketModel({
        required this.success,
        required this.result,
    });

    factory CricketModel.fromJson(Map<String, dynamic> json) => CricketModel(
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
    String leagueYear;

    Result({
        required this.leagueKey,
        required this.leagueName,
        required this.leagueYear,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        leagueKey: json["league_key"],
        leagueName: json["league_name"],
        leagueYear: json["league_year"],
    );

    Map<String, dynamic> toJson() => {
        "league_key": leagueKey,
        "league_name": leagueName,
        "league_year": leagueYear,
    };
}
