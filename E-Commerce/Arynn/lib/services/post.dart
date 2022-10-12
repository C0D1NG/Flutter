
import 'dart:convert';
import 'package:http/http.dart';

Future <dynamic> postContents(dynamic url,dynamic payload){
  Map<String,String> header = {'Content-Type':'application/json;charset=UTF-8'};
  Uri parsedUrl = Uri.parse(url);
  return post(parsedUrl,headers:header,body:jsonEncode(<String,String>{...payload}));
}