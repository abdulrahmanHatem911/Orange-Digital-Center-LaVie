// To parse this JSON data, do
//
//     final forumsPost = forumsPostFromJson(jsonString);

import 'dart:convert';

ForumsPost forumsPostFromJson(String str) =>
    ForumsPost.fromJson(json.decode(str));

String forumsPostToJson(ForumsPost data) => json.encode(data.toJson());

class ForumsPost {
  ForumsPost({
    this.type,
    this.message,
    this.data,
  });

  String? type;
  String? message;
  Data? data;

  factory ForumsPost.fromJson(Map<String, dynamic> json) => ForumsPost(
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
    this.forumId,
    this.title,
    this.description,
    this.imageUrl,
    this.userId,
  });

  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        forumId: json["forumId"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "forumId": forumId,
        "title": title,
        "description": description,
        "imageUrl": imageUrl,
        "userId": userId,
      };
}
