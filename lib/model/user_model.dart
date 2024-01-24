// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserData? data;
    int? status;
    String? message;

    UserModel({
        this.data,
        this.status,
        this.message,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: UserData.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "status": status,
        "message": message,
    };
}

class UserData {
    String? id;
    String? userid;
    String? password;
    String? fullname;
    String? phoneno;
    String? email;
    String? role;

    UserData({
        this.id,
        this.userid,
        this.password,
        this.fullname,
        this.phoneno,
        this.email,
        this.role,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
