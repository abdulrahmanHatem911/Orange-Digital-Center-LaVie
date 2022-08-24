// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.type,
    this.message,
    this.data,
  });

  String? type;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  User? user;
  String? accessToken;
  String? refreshToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class User {
  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.address,
    this.role,
  });

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  dynamic address;
  String? role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        address: json["address"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "imageUrl": imageUrl,
        "address": address,
        "role": role,
      };
}
