import 'package:desafio_web_services/data/model/price.dart';
import 'package:desafio_web_services/data/model/thumbnail.dart';

import 'date.dart';

class Results {
  String? title;
  int? issueNumber;
  String? description;
  int? pageCount;
  List<Date>? dates;
  List<Price>? prices;
  Thumbnail? thumbnail;

  Results({
    this.title,
    this.issueNumber,
    this.description,
    this.pageCount,
    this.dates,
    this.prices,
    this.thumbnail,
  });

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    issueNumber = json['issueNumber'];
    description = json['description'];
    pageCount = json['pageCount'];
    if (json['dates'] != null) {
      dates = <Date>[];
      json['dates'].forEach((v) {
        dates?.add(Date.fromJson(v));
      });
    }
    if (json['prices'] != null) {
      prices = <Price>[];
      json['prices'].forEach((v) {
        prices?.add(Price.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['issueNumber'] = issueNumber;
    data['description'] = description;
    data['pageCount'] = pageCount;
    if (dates != null) {
      data['dates'] = dates?.map((v) => v.toJson()).toList();
    }
    if (prices != null) {
      data['prices'] = prices?.map((v) => v.toJson()).toList();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail?.toJson();
    }
    return data;
  }
}
