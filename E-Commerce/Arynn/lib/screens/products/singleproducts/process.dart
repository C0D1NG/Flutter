
import 'dart:convert';

import 'package:ecommerce_app/services/urls.dart';
import 'package:ecommerce_app/services/post.dart';
import 'package:http/http.dart';

Future<Map<String,dynamic>> postCarts(Map<String,dynamic> payload) async{
    Response response  = await postContents(urls["postcart"], payload);
    Map<String,dynamic> bodyResponse = jsonDecode(response.body);
    return bodyResponse;
}
