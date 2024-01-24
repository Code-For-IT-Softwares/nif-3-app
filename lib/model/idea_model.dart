// To parse this JSON data, do
//
//     final ideaListModel = ideaListModelFromJson(jsonString);

import 'dart:convert';

IdeaListModel ideaListModelFromJson(String str) => IdeaListModel.fromJson(json.decode(str));

String ideaListModelToJson(IdeaListModel data) => json.encode(data.toJson());

class IdeaListModel {
    List<Idea>? data;
    int? status;
    String? message;

    IdeaListModel({
        this.data,
        this.status,
        this.message,
    });

    factory IdeaListModel.fromJson(Map<String, dynamic> json) => IdeaListModel(
        data: List<Idea>.from(json["data"].map((x) => Idea.fromJson(x))),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
        "message": message,
    };
}

class Idea {
    String? id;
    String? registrationid;
    String? phoneno;
    String? whatsappno;
    String? email;
    String? teamname;
    String? leadername;
    List<String>? membersname;
    String? collegename;
    String? city;
    String? state;
    String? ideatheme;
    String? ideadescription;
    String? idcardimage;
    DateTime? datetime;

    Idea({
        this.id,
        this.registrationid,
        this.phoneno,
        this.whatsappno,
        this.email,
        this.teamname,
        this.leadername,
        this.membersname,
        this.collegename,
        this.city,
        this.state,
        this.ideatheme,
        this.ideadescription,
        this.idcardimage,
        this.datetime,
    });

    factory Idea.fromJson(Map<String, dynamic> json) => Idea(
        id: json["_id"],
        registrationid: json["registrationid"],
        phoneno: json["phoneno"],
        whatsappno: json["whatsappno"],
        email: json["email"],
        teamname: json["teamname"],
        leadername: json["leadername"],
        membersname: List<String>.from(json["membersname"].map((x) => x)),
        collegename: json["collegename"],
        city: json["city"],
        state: json["state"],
        ideatheme: json["ideatheme"],
        ideadescription: json["ideadescription"],
        idcardimage: json["idcardimage"],
        datetime: DateTime.parse(json["datetime"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "registrationid": registrationid,
        "phoneno": phoneno,
        "whatsappno": whatsappno,
        "email": email,
        "teamname": teamname,
        "leadername": leadername,
        "membersname": List<dynamic>.from(membersname!.map((x) => x)),
        "collegename": collegename,
        "city": city,
        "state": state,
        "ideatheme": ideatheme,
        "ideadescription": ideadescription,
        "idcardimage": idcardimage,
        "datetime": datetime!.toIso8601String(),
    };
}