import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../response/newsapi.dart';

class Filter{
  late String title;
  late String isSelected;

  RxList<bool> ischeck = [false].obs;
  RxList<String> sources = ['source'].obs;

  Filter(this.title, this.isSelected);

  Filter.fromJson(Map<String, dynamic> json) {
   // title = json['source'] != null ? Source.fromJson(json['source']) : null;
    isSelected = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = name;
    // data['name'] = phone;
    return data;
  }
}