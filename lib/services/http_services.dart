import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'cache_values.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class HttpResult {
  final bool isSuccess;
  final int status;
  final String body;

  HttpResult(this.isSuccess, this.status, this.body);
}

class ApiRequests {
  static Future<HttpResult> _result(response) async {
    dynamic body = response.body;
    int status = response.statusCode ?? 404;
    if(response.statusCode >= 200 && response.statusCode <= 299){
      return HttpResult(true, status, body);
    } else {
      return HttpResult(false, status, body);
    }
  }

  Future<HttpResult> get({required String url}) async {
    Uri uri = Uri.parse(url);
    try{
      final response =  await http.get(uri);
      return _result(response);
    } on TimeoutException catch (error) {
      CacheKeys.checkConnection(false);
      log("TimeOutException: $error");
      return _result({});
    } on SocketException catch (error) {
      CacheKeys.checkConnection(false);
      log("SocketException: $error");
      return _result({});
    } catch (error) {
      log("Unexpected post error: $error");
      return _result({});
    }
  }

  Future<HttpResult> post({required String url, required Map<String, dynamic> body}) async {
    Uri uri = Uri.parse(url);
    try {
      final response = await http.post(
        uri,
        body: jsonEncode(body),
      );
      return _result(response);
    } on TimeoutException catch (error) {
      CacheKeys.checkConnection(false);
      debugPrint("TimeOutException: $error");
      return _result({});
    } on SocketException catch (error) {
      CacheKeys.checkConnection(false);
      debugPrint("SocketException: $error");
      return _result({});
    } catch (error) {
      debugPrint("Unexpected post error: $error");
      return _result({});
    }
  }

  Future<HttpResult> put({required String url, required Map<String, dynamic> body}) async {
    Uri uri = Uri.parse(url);
    try {
      final response = await http.put(
        uri,
        body: jsonEncode(body),
      );
      return _result(response);
    } on TimeoutException catch (error) {
      debugPrint("TimeOutException: $error");
      CacheKeys.checkConnection(false);
      return _result({});
    } on SocketException catch (error) {
      debugPrint("SocketException: $error");
      CacheKeys.checkConnection(false);
      return _result({});
    } catch (error) {
      debugPrint("Unexpected post error: $error");
      return _result({});
    }
  }

  Future<HttpResult> delete({required String url, required Map<String, dynamic> body}) async {
    Uri uri = Uri.parse(url);
    try {
      final response = await http.delete(
        uri,
        body: jsonEncode(body),
      );
      return _result(response);
    } on TimeoutException catch (error) {
      debugPrint("TimeOutException: $error");
      CacheKeys.checkConnection(false);
      return _result({});
    } on SocketException catch (error) {
      debugPrint("SocketException: $error");
      CacheKeys.checkConnection(false);
      return _result({});
    } catch (error) {
      debugPrint("Unexpected post error: $error");
      return _result({});
    }
  }
}