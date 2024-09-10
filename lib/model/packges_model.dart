// To parse this JSON data, do
//
//     final packagesMode = packagesModeFromJson(jsonString);

import 'dart:convert';

PackagesModel packagesModeFromJson(String str) =>
    PackagesModel.fromJson(json.decode(str));

String packagesModeToJson(PackagesModel data) => json.encode(data.toJson());

class PackagesModel {
  String? code;
  String? status;
  String? message;
  List<Response>? response;

  PackagesModel({
    this.code,
    this.status,
    this.message,
    this.response,
  });

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        response: json["response"] == null
            ? []
            : List<Response>.from(
                json["response"]!.map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Response {
  String? title;
  String? price;
  String? desc;

  Response({
    this.title,
    this.price,
    this.desc,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        title: json["title"],
        price: json["price"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "desc": desc,
      };
}
