// To parse this JSON data, do
//
//     final prototypeListModel = prototypeListModelFromJson(jsonString);

import 'dart:convert';

PrototypeListModel prototypeListModelFromJson(String str) => PrototypeListModel.fromJson(json.decode(str));

String prototypeListModelToJson(PrototypeListModel data) => json.encode(data.toJson());

class PrototypeListModel {
    List<Prototype>? data;
    int? status;
    String? message;

    PrototypeListModel({
        this.data,
        this.status,
        this.message,
    });

    factory PrototypeListModel.fromJson(Map<String, dynamic> json) => PrototypeListModel(
        data: List<Prototype>.from(json["data"].map((x) => Prototype.fromJson(x))),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
        "message": message,
    };
}

class Prototype {
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
    String? projecttheme;
    String? projectdescription;
    String? uniqueness;
    String? projectimage;
    String? idcardimage;
    DateTime? datetime;

    Prototype({
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
        this.projecttheme,
        this.projectdescription,
        this.uniqueness,
        this.projectimage,
        this.idcardimage,
        this.datetime,
    });

    factory Prototype.fromJson(Map<String, dynamic> json) => Prototype(
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
        projecttheme: json["projecttheme"],
        projectdescription: json["projectdescription"],
        uniqueness: json["uniqueness"],
        projectimage: json["projectimage"],
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
        "projecttheme": projecttheme,
        "projectdescription": projectdescription,
        "uniqueness": uniqueness,
        "projectimage": projectimage,
        "idcardimage": idcardimage,
        "datetime": datetime!.toIso8601String(),
    };
}