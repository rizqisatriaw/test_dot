import 'dart:convert';

PlaceResponse placeResponseFromJson(String str) =>
    PlaceResponse.fromJson(json.decode(str));

String placeResponseToJson(PlaceResponse data) => json.encode(data.toJson());

class PlaceResponse {
  final int? statusCode;
  final String? message;
  final Data? data;

  PlaceResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory PlaceResponse.fromJson(Map<String, dynamic> json) => PlaceResponse(
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final Header? header;
  final List<Content>? content;

  Data({
    this.header,
    this.content,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        header: json["header"] == null ? null : Header.fromJson(json["header"]),
        content: json["content"] == null
            ? []
            : List<Content>.from(
                json["content"]!.map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "header": header?.toJson(),
        "content": content == null
            ? []
            : List<dynamic>.from(content!.map((x) => x.toJson())),
      };
}

class Content {
  final int? id;
  final String? title;
  final String? content;
  final String? type;
  final String? image;
  final List<String>? media;

  Content({
    this.id,
    this.title,
    this.content,
    this.type,
    this.image,
    this.media,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        type: json["type"],
        image: json["image"],
        media: json["media"] == null
            ? []
            : List<String>.from(json["media"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "type": type,
        "image": image,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
      };
}

class Header {
  final String? title;
  final String? subtitle;

  Header({
    this.title,
    this.subtitle,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        title: json["title"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
      };
}
