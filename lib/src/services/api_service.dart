// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/constants/app_api_endpoint.dart';
import 'package:hr56_staff/src/core/error/exceptions.dart';
import 'package:logger/logger.dart';

abstract class ApiService {
  //? For making get request to the endpoint
  Future<dynamic> get({
    required Uri url,
    required Map<String, dynamic> queryParameters,
    Map<String, dynamic>? headers,
  });

  //? For making post request to the endpoint
  Future<dynamic> post({
    required Uri url,
    required dynamic body,
    Map<String, String> headers,
  });

  //? For making patch request to the endpoint
  Future<dynamic> patch({
    required Uri url,
    required Map<String, dynamic> body,
    Map<String, String> headers,
  });

  //? For making delete request to the endpoint
  Future<dynamic> delete({
    required Uri url,
    Map<String, dynamic>? queryParameters,
    Map<String, String> headers,
  });

  //? For downloading file from the endpoint
  Future<void> download({
    required Uri url,
    required String path,
    required Map<String, String> header,
  });
}

class ApiServiceImpl implements ApiService {
  ApiServiceImpl(this._dio) {
    _dio.options.baseUrl = AppApiEndpoint.baseUri.toString();
    _dio.options.sendTimeout = AppApiEndpoint.sendTimeout;
    _dio.options.receiveTimeout = AppApiEndpoint.receiveTimeout;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          debugPrint('Error: ${e.message}');
          handler.next(e);
        },
        onRequest: (r, handler) {
          handler.next(r);
        },
        onResponse: (r, handler) {
          handler.next(r);
        },
      ),
    );

    _log.i('Api constructed and DIO setup register');
  }
  final _log = Logger();
  final Dio _dio;

  @override
  Future<dynamic> get({
    required Uri url,
    required Map<String, dynamic> queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    _log.i(
      'Making Get Request to $url with the following '
      'data \n${jsonEncode(queryParameters)}',
    );
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        url.toString(),
        queryParameters: queryParameters,
        options: Options(headers: headers, contentType: 'application/json'),
      );
      _log.i('Response from $url \n${response.data}');
      return response.data;
    } on DioError catch (error, trace) {
      _log.e('Error from $url', error.message);
      throw ServerException(
        trace: trace,
        message: error.message,
      );
    }
  }

  @override
  Future<dynamic> post({
    required Uri url,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    final jsonBody = jsonEncode(body);
    _log
      ..i(
        'Making Post Request to $url with the following data'
        ' \n${jsonBody.substring(0, jsonBody.length ~/ 2)}',
      )
      ..i(jsonBody.substring(jsonBody.length ~/ 2));
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        url.toString(),
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      _log.i('Response from $url \n${response.data}');
      return response.data;
    } on DioError catch (error, trace) {
      _log.e('Error from $url', error.message);
      throw ServerException(
        trace: trace,
        message: error.message,
      );
    }
  }

  @override
  Future<dynamic> patch({
    required Uri url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    _log.i('Making Patch Request to $url with the following data \n$body');
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        url.toString(),
        data: body,
        options: Options(
          headers: headers,
        ),
      );

      _log.i('Response from $url \n${response.data}');
      return response.data;
    } on DioError catch (error, trace) {
      _log.e('Error from $url', error.toString());
      throw ServerException(
        trace: trace,
        message: error.message,
      );
    }
  }

  @override
  Future<dynamic> delete({
    required Uri url,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    _log.i('Making Delete Request to $url.');
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        url.toString(),
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      _log.i('Response from $url \n${response.data}');
      return response.data;
    } on DioError catch (error, trace) {
      _log.e('Error from $url', error.toString());
      throw ServerException(
        trace: trace,
        message: error.message,
      );
    }
  }

  @override
  Future<void> download({
    required Uri url,
    required String path,
    required Map<String, String> header,
  }) async {
    try {
      final response = await _dio.download(
        url.toString(),
        path,
        onReceiveProgress: (received, total) {
          _log.e('$received $total $path');
        },
        options: Options(
          headers: header,
        ),
      );
      _log.i('Response from $url \n${response.data}');
      return response.data;
    } on DioError catch (error, trace) {
      _log.e('Error from $url', error.toString());
      throw ServerException(
        trace: trace,
        message: error.message,
      );
    }
  }
}
