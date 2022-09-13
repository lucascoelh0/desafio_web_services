import 'dart:convert';

import 'data.dart';

Comics comicsFromJson(String str) => Comics.fromJson(json.decode(str));

String comicsToJson(Comics data) => json.encode(data.toJson());

class Comics {
  Data? data;

  Comics({this.data});

  Comics.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
