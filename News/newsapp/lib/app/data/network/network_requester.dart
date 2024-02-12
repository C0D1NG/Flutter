import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:starter/app/data/values/constants.dart';
import 'package:starter/app/data/values/env.dart';
import 'package:starter/utils/helper/exception_handler.dart';

import '../values/strings.dart';

class NetworkRequester {
  late Dio _dio;
  late Connectivity _connectivity;

  NetworkRequester() {
    prepareRequest();
    _connectivity = Connectivity();
  }

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: Timeouts.CONNECT_TIMEOUT,
      receiveTimeout: Timeouts.RECEIVE_TIMEOUT,
      baseUrl: Env.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {'Accept': Headers.jsonContentType},
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    _dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      logPrint: _printLog,
    ));
  }

  _printLog(Object object) => log(object.toString());

  // Future<dynamic> get({
  //   required String path,
  //   Map<String, dynamic>? query,
  // }) async {
  //   try {
  //     final response = await _dio.get(path, queryParameters: query);
  //     return response.data;
  //   } on Exception catch (error, stack) {
  //     FirebaseCrashlytics.instance.recordError(error, stack);
  //     return ExceptionHandler.handleError(error);
  //   }
  // }

  Future<dynamic> get(
      {required String path,
      Map<String, dynamic>? query,
      Options? requestOptions}) async {
    try {
      final response =
          await _dio.get(path, queryParameters: query, options: requestOptions);
      return response.data;
    } on Exception catch (exception) {
      final connectivityAtPresent = await _connectivity.checkConnectivity();
      if (connectivityAtPresent == ConnectivityResult.none) {
        return APIException(
            message: ErrorMessages.noInternet, noInternet: true);
      }
      return ExceptionHandler.handleError(exception);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: query,
        data: data,
      );
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.put(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.patch(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return ExceptionHandler.handleError(error);
    }
  }
}
