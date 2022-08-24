// To parse this JSON data, do
//
//     final allBlogs = allBlogsFromJson(jsonString);

import 'dart:convert';

AllBlogs allBlogsFromJson(String str) => AllBlogs.fromJson(json.decode(str));

String allBlogsToJson(AllBlogs data) => json.encode(data.toJson());

class AllBlogs {
  AllBlogs({
    this.type,
    this.message,
    this.data,
  });

  String? type;
  String? message;
  Data? data;

  factory AllBlogs.fromJson(Map<String, dynamic> json) => AllBlogs(
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
    this.plants,
    this.seeds,
    this.tools,
  });

  List<Plant>? plants;
  List<Seed>? seeds;
  List<Seed>? tools;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        plants: List<Plant>.from(json["plants"].map((x) => Plant.fromJson(x))),
        seeds: List<Seed>.from(json["seeds"].map((x) => Seed.fromJson(x))),
        tools: List<Seed>.from(json["tools"].map((x) => Seed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "plants": List<dynamic>.from(plants!.map((x) => x.toJson())),
        "seeds": List<dynamic>.from(seeds!.map((x) => x.toJson())),
        "tools": List<dynamic>.from(tools!.map((x) => x.toJson())),
      };
}

class Plant {
  Plant({
    this.plantId,
    this.name,
    this.description,
    this.imageUrl,
    this.waterCapacity,
    this.sunLight,
    this.temperature,
  });

  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        plantId: json["plantId"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        waterCapacity: json["waterCapacity"],
        sunLight: json["sunLight"],
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "plantId": plantId,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "waterCapacity": waterCapacity,
        "sunLight": sunLight,
        "temperature": temperature,
      };
}

class Seed {
  Seed({
    this.seedId,
    this.name,
    this.description,
    this.imageUrl,
    this.toolId,
  });

  String? seedId;
  String? name;
  String? description;
  String? imageUrl;
  String? toolId;

  factory Seed.fromJson(Map<String, dynamic> json) => Seed(
        seedId: json["seedId"] == null ? null : json["seedId"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        toolId: json["toolId"] == null ? null : json["toolId"],
      );

  Map<String, dynamic> toJson() => {
        "seedId": seedId == null ? null : seedId,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "toolId": toolId == null ? null : toolId,
      };
}
