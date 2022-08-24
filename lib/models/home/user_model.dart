// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.type,
    this.message,
    this.data,
  });

  String? type;
  String? message;
  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        type: json["type"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.address,
    this.role,
    this.userPoints,
    this.userNotification,
  });

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  dynamic address;
  String? role;
  dynamic userPoints;
  List<dynamic>? userNotification;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        address: json["address"],
        role: json["role"],
        userPoints: json["UserPoints"],
        userNotification:
            List<dynamic>.from(json["UserNotification"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "imageUrl": imageUrl,
        "address": address,
        "role": role,
        "UserPoints": userPoints,
        "UserNotification": List<dynamic>.from(userNotification!.map((x) => x)),
      };
}
