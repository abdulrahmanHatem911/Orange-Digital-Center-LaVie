class Products {
  Products({
    this.type,
    this.message,
    this.data,
  });

  String? type;
  String? message;
  List<Datum>? data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        type: json["type"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.productId,
    this.name,
    this.description,
    this.imageUrl,
    this.type,
    this.price,
    this.available,
    this.seed,
    this.plant,
    this.tool,
  });

  String? productId;
  String? name;
  Description? description;
  String? imageUrl;
  Type? type;
  int? price;
  int index = 1;
  bool? available;
  Seed? seed;
  Plant? plant;
  Seed? tool;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["productId"],
        name: json["name"],
        description: descriptionValues.map![json["description"]],
        imageUrl: json["imageUrl"],
        type: typeValues.map![json["type"]],
        price: json["price"],
        available: json["available"],
        seed: json["seed"] == null ? null : Seed.fromJson(json["seed"]),
        plant: json["plant"] == null ? null : Plant.fromJson(json["plant"]),
        tool: json["tool"] == null ? null : Seed.fromJson(json["tool"]),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "description": descriptionValues.reverse![description],
        "imageUrl": imageUrl,
        "type": typeValues.reverse![type],
        "price": price,
        "available": available,
        "seed": seed == null ? null : seed!.toJson(),
        "plant": plant == null ? null : plant!.toJson(),
        "tool": tool == null ? null : tool!.toJson(),
      };
}

enum Description {
  ARIZONA_ACHIEVED_STATEHOOD,
  THIS_SPRING_BLOOMER,
  WIL_FIKS_CHOPPING_AXE
}

final descriptionValues = EnumValues({
  "Arizona achieved statehood": Description.ARIZONA_ACHIEVED_STATEHOOD,
  "This spring bloomer": Description.THIS_SPRING_BLOOMER,
  "WilFiks Chopping Axe": Description.WIL_FIKS_CHOPPING_AXE
});

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

enum Type { PLANT, SEED, TOOL }

final typeValues =
    EnumValues({"PLANT": Type.PLANT, "SEED": Type.SEED, "TOOL": Type.TOOL});

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
