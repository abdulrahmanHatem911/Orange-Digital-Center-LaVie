// To parse this JSON data, do
//
//     final forums = forumsFromJson(jsonString);

import 'dart:convert';

Forums forumsFromJson(String str) => Forums.fromJson(json.decode(str));

String forumsToJson(Forums data) => json.encode(data.toJson());

class Forums {
  Forums({
    this.type,
    this.message,
    this.data,
  });

  String? type;
  String? message;
  List<DatumForums>? data;

  factory Forums.fromJson(Map<String, dynamic> json) => Forums(
        type: json["type"],
        message: json["message"],
        data: List<DatumForums>.from(
            json["data"].map((x) => DatumForums.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumForums {
  DatumForums({
    this.forumId,
    this.title,
    this.description,
    this.imageUrl,
    this.userId,
    this.forumLikes,
    this.forumComments,
  });

  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;
  List<ForumLike>? forumLikes;
  List<ForumComment>? forumComments;

  factory DatumForums.fromJson(Map<String, dynamic> json) => DatumForums(
        forumId: json["forumId"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        userId: json["userId"],
        forumLikes: List<ForumLike>.from(
            json["ForumLikes"].map((x) => ForumLike.fromJson(x))),
        forumComments: List<ForumComment>.from(
            json["ForumComments"].map((x) => ForumComment.fromJson(x))),
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
  Comment? comment;
  DateTime? createdAt;

  factory ForumComment.fromJson(Map<String, dynamic> json) => ForumComment(
        forumCommentId: json["forumCommentId"],
        forumId: json["forumId"],
        userId: json["userId"],
        comment: commentValues.map![json["comment"]],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "forumCommentId": forumCommentId,
        "forumId": forumId,
        "userId": userId,
        "comment": commentValues.reverse![comment],
        "createdAt": createdAt!.toIso8601String(),
      };
}

enum Comment { TEST, CONSECTETUR_ULLAMCO_CILLUM_IRU, NISI_DOLOR_REPREHENDERIT }

final commentValues = EnumValues({
  "consectetur ullamco cillum iru": Comment.CONSECTETUR_ULLAMCO_CILLUM_IRU,
  "nisi dolor reprehenderit": Comment.NISI_DOLOR_REPREHENDERIT,
  "Test": Comment.TEST
});

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

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
