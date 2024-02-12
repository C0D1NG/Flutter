import 'package:starter/app/data/models/dto/user.dart';

class UserResponse {
  late User? data;
  late int statusCode;

  UserResponse({required this.data, required this.statusCode});

  UserResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] == null ? null : User.fromJson(json['data']);
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data?.toJson();
    data['statusCode'] = statusCode;
    return data;
  }
}
