import 'dart:convert';

import 'package:ecommerce_app/services/urls.dart';
import 'package:ecommerce_app/services/get.dart';
import 'package:http/http.dart';



Future<List<dynamic>> getCartsContents() async {
  Response response = await getContents(urls["getcart"]);
  List<dynamic> bodyResponse = jsonDecode(response.body);
  return bodyResponse;
}