import 'dart:convert';

GalleryResponse galleryResponseFromJson(String str) =>
    GalleryResponse.fromJson(json.decode(str));

String galleryResponseToJson(GalleryResponse data) =>
    json.encode(data.toJson());

class GalleryResponse {
  final int? statusCode;
  final String? message;
  final List<Datum>? data;

  GalleryResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory GalleryResponse.fromJson(Map<String, dynamic> json) =>
      GalleryResponse(
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? caption;
  final String? thumbnail;
  final String? image;

  Datum({
    this.caption,
    this.thumbnail,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        caption: json["caption"],
        thumbnail: json["thumbnail"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "thumbnail": thumbnail,
        "image": image,
      };
}
