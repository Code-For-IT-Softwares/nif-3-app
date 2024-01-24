// To parse this JSON data, do
//
//     final newUser = newUserFromJson(jsonString);

import 'dart:convert';

NewUserModel newUserFromJson(String str) => NewUserModel.fromJson(json.decode(str));

String newUserToJson(NewUserModel data) => json.encode(data.toJson());

class NewUserModel {
    NewUserData? data;
    int? status;
    String? message;

    NewUserModel({
        this.data,
        this.status,
        this.message,
    });

    factory NewUserModel.fromJson(Map<String, dynamic> json) => NewUserModel(
        data: NewUserData.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
        "message": message,
    };
}

class NewUserData {
    String? id;
    String? userid;
    String? password;
    String? fullname;
    String? phoneno;
    String? email;
    String? role;

    NewUserData({
        this.id,
        this.userid,
        this.password,
        this.fullname,
        this.phoneno,
        this.email,
        this.role,
    });

    factory NewUserData.fromJson(Map<String, dynamic> json) => NewUserData(
        id: json["_id"],
        userid: json["userid"],
        password: json["password"],
        fullname: json["fullname"],
        phoneno: json["phoneno"],
        email: json["email"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userid": userid,
        "password": password,
        "fullname": fullname,
        "phoneno": phoneno,
        "email": email,
        "role": role,
    };
}
