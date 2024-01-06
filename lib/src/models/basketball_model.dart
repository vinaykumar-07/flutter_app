// To parse this JSON data, do
//
//     final basketballModel = basketballModelFromJson(jsonString);

import 'dart:convert';

BasketballModel basketballModelFromJson(String str) => BasketballModel.fromJson(json.decode(str));

String basketballModelToJson(BasketballModel data) => json.encode(data.toJson());

class BasketballModel {
    int success;
    List<Result> result;

    BasketballModel({
        required this.success,
        required this.result,
    });

    factory BasketballModel.fromJson(Map<String, dynamic> json) => BasketballModel(
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
        countryName: json["country_name"],
    );

    Map<String, dynamic> toJson() => {
        "league_key": leagueKey,
        "league_name": leagueName,
        "country_key": countryKey,
        "country_name": countryName,
    };
}
