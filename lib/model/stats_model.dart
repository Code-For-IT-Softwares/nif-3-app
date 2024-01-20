// To parse this JSON data, do
//
//     final statModel = statModelFromJson(jsonString);

import 'dart:convert';

StatModel statModelFromJson(String str) => StatModel.fromJson(json.decode(str));

String statModelToJson(StatModel data) => json.encode(data.toJson());

class StatModel {
    Stat? data;
    int? status;
    String? message;

    StatModel({
        this.data,
        this.status,
        this.message,
    });

    factory StatModel.fromJson(Map<String, dynamic> json) => StatModel(
        data: Stat.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
        "message": message,
    };
}

class Stat {
    int? totalstartup;
    int? totalprototype;
    int? totalidea;
    int? totalparticipants;

    Stat({
        this.totalstartup,
        this.totalprototype,
        this.totalidea,
        this.totalparticipants,
    });

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        totalstartup: json["totalstartup"],
        totalprototype: json["totalprototype"],
        totalidea: json["totalidea"],
        totalparticipants: json["totalparticipants"],
    );

    Map<String, dynamic> toJson() => {
        "totalstartup": totalstartup,
        "totalprototype": totalprototype,
        "totalidea": totalidea,
        "totalparticipants": totalparticipants,
    };
}
