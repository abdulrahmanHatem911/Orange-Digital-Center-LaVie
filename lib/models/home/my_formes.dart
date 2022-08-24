// To parse this JSON data, do
//
//     final myForums = myForumsFromJson(jsonString);

import 'dart:convert';

MyForums myForumsFromJson(String str) => MyForums.fromJson(json.decode(str));

String myForumsToJson(MyForums data) => json.encode(data.toJson());

class MyForums {
  MyForums({
    this.type,
    this.message,
    this.data,
  });

  String? type;
  String? message;
  List<DatumMYForums>? data;

  factory MyForums.fromJson(Map<String, dynamic> json) => MyForums(
        type: json["type"],
        message: json["message"],
        data: List<DatumMYForums>.from(
            json["data"].map((x) => DatumMYForums.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumMYForums {
  DatumMYForums({
    this.forumId,
    this.title,
    this.description,
    this.imageUrl,
    this.userId,
    this.forumLikes,
    this.forumComments,
    this.user,
  });

  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;
  List<ForumLike>? forumLikes;
  List<ForumComment>? forumComments;
  User? user;

  factory DatumMYForums.fromJson(Map<String, dynamic> json) => DatumMYForums(
        forumId: json["forumId"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        userId: json["userId"],
        forumLikes: List<ForumLike>.from(
            json["ForumLikes"].map((x) => ForumLike.fromJson(x))),
        forumComments: List<ForumComment>.from(
            json["ForumComments"].map((x) => ForumComment.fromJson(x))),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "forumId": forumId,
        "title": title,
        "description": description,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "userId": userId,
        "ForumLikes": List<dynamic>.from(forumLikes!.map((x) => x.toJson())),
        "ForumComments":
            List<dynamic>.from(forumComments!.map((x) => x.toJson())),
        "user": user!.toJson(),
      };
}

class ForumComment {
  ForumComment({
    this.forumCommentId,
    this.forumId,
    this.userId,
    this.comment,
    this.createdAt,
  });

  String? forumCommentId;
  String? forumId;
  String? userId;
  String? comment;
  DateTime? createdAt;

  factory ForumComment.fromJson(Map<String, dynamic> json) => ForumComment(
        forumCommentId: json["forumCommentId"],
        forumId: json["forumId"],
        userId: json["userId"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "forumCommentId": forumCommentId,
        "forumId": forumId,
        "userId": userId,
        "comment": comment,
        "createdAt": createdAt!.toIso8601String(),
      };
}

class ForumLike {
  ForumLike({
    this.forumId,
    this.userId,
  });

  String? forumId;
  String? userId;

  factory ForumLike.fromJson(Map<String, dynamic> json) => ForumLike(
        forumId: json["forumId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "forumId": forumId,
        "userId": userId,
      };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.imageUrl,
  });

  String? firstName;
  String? lastName;
  String? imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "imageUrl": imageUrl,
      };
}
