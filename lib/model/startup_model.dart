// To parse this JSON data, do
//
//     final startUpListModel = startUpListModelFromJson(jsonString);

import 'dart:convert';

StartUpListModel startUpListModelFromJson(String str) => StartUpListModel.fromJson(json.decode(str));

String startUpListModelToJson(StartUpListModel data) => json.encode(data.toJson());

class StartUpListModel {
    List<StartUp>? data;
    int? status;
    String? message;

    StartUpListModel({
        this.data,
        this.status,
        this.message,
    });

    factory StartUpListModel.fromJson(Map<String, dynamic> json) => StartUpListModel(
        data: List<StartUp>.from(json["data"].map((x) => StartUp.fromJson(x))),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
        "message": message,
    };
}

class StartUp {
    String? id;
    String? registrationid;
    String? phoneno;
    String? whatsappno;
    String? email;
    String? cinno;
    String? dpiitno;
    String? companyname;
    String? foundername;
    String? city;
    String? state;
    String? pincode;
    String? sector;
    String? websiteurl;
    String? productdescription;
    bool? fundingrequired;
    int? amount;
    String? idcardimage;
    String? pitchdeck;
    DateTime? datetime;

    StartUp({
        this.id,
        this.registrationid,
        this.phoneno,
        this.whatsappno,
        this.email,
        this.cinno,
        this.dpiitno,
        this.companyname,
        this.foundername,
        this.city,
        this.state,
        this.pincode,
        this.sector,
        this.websiteurl,
        this.productdescription,
        this.fundingrequired,
        this.amount,
        this.idcardimage,
        this.pitchdeck,
        this.datetime,
    });

    factory StartUp.fromJson(Map<String, dynamic> json) => StartUp(
        id: json["_id"],
        registrationid: json["registrationid"],
        phoneno: json["phoneno"],
        whatsappno: json["whatsappno"],
        email: json["email"],
        cinno: json["cinno"],
        dpiitno: json["dpiitno"],
        companyname: json["companyname"],
        foundername: json["foundername"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        sector: json["sector"],
        websiteurl: json["websiteurl"],
        productdescription: json["productdescription"],
        fundingrequired: json["fundingrequired"],
        amount: json["amount"],
        idcardimage: json["idcardimage"],
        pitchdeck: json["pitchdeck"],
        datetime: DateTime.parse(json["datetime"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "registrationid": registrationid,
        "phoneno": phoneno,
        "whatsappno": whatsappno,
        "email": email,
        "cinno": cinno,
        "dpiitno": dpiitno,
        "companyname": companyname,
        "foundername": foundername,
        "city": city,
        "state": state,
        "pincode": pincode,
        "sector": sector,
        "websiteurl": websiteurl,
        "productdescription": productdescription,
        "fundingrequired": fundingrequired,
        "amount": amount,
        "idcardimage": idcardimage,
        "pitchdeck": pitchdeck,
        "datetime": datetime!.toIso8601String(),
    };
}
