import 'package:starter/utils/helper/exception_handler.dart';

class RepoResponse<T> {
  final APIException? error;
  final T? data;

  RepoResponse({this.error, this.data});
}

class DataWrapper<T> {
  T? data;
  String? error;

  DataWrapper({this.error, this.data});
}
