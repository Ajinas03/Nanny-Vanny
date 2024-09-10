// To parse this JSON data, do
//
//     final currentBookingList = currentBookingListFromJson(jsonString);

import 'dart:convert';

CurrentBookingModel currentBookingListFromJson(String str) =>
    CurrentBookingModel.fromJson(json.decode(str));

String currentBookingListToJson(CurrentBookingModel data) =>
    json.encode(data.toJson());

class CurrentBookingModel {
  String? code;
  String? status;
  String? message;
  List<Response>? response;

  CurrentBookingModel({
    this.code,
    this.status,
    this.message,
    this.response,
  });

  factory CurrentBookingModel.fromJson(Map<String, dynamic> json) =>
      CurrentBookingModel(
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
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  Response({
    this.title,
    this.fromDate,
    this.fromTime,
    this.toDate,
    this.toTime,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        title: json["title"],
        fromDate: json["from_date"],
        fromTime: json["from_time"],
        toDate: json["to_date"],
        toTime: json["to_time"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "from_date": fromDate,
        "from_time": fromTime,
        "to_date": toDate,
        "to_time": toTime,
      };
}
