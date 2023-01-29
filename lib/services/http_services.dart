import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'cache_values.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

class AppConfig {
  static String baseUrlOld = "https://agro-life.uz/api/v1";
  static String baseUrl = "https://agrosoft.uz/api/v1";
}

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

  Future<HttpResult> get({required String slug}) async {
    Uri url = Uri.parse("${AppConfig.baseUrl}/$slug");
    try{
      final response =  await http.get(url);
      return _result(response);
    } on TimeoutException catch (error) {
      //CacheKeys.checkConnection(false);
      log("TimeOutException: $error");
      return _result({});
    } on SocketException catch (error) {
      //CacheKeys.checkConnection(false);
      log("SocketException: $error");
      return _result({});
    } catch (error) {
      log("Unexpected post error: $error");
      return _result({});
    }
  }

  Future<HttpResult> post({required String slug, required Map<String, dynamic> body}) async {
    Uri url = Uri.parse("${AppConfig.baseUrl}/$slug");
    try {
      final response = await http.post(
        url,
        body: jsonEncode(body),
      );
      return _result(response);
    } on TimeoutException catch (error) {
      //CacheKeys.checkConnection(false);
      debugPrint("TimeOutException: $error");
      return _result({});
    } on SocketException catch (error) {
      //CacheKeys.checkConnection(false);
      debugPrint("SocketException: $error");
      return _result({});
    } catch (error) {
      debugPrint("Unexpected post error: $error");
      return _result({});
    }
  }

  Future<HttpResult> put({required String slug, required Map<String, dynamic> body}) async {
    Uri url = Uri.parse("${AppConfig.baseUrl}/$slug");
    try {
      final response = await http.put(
        url,
        body: jsonEncode(body),
      );
      return _result(response);
    } on TimeoutException catch (error) {
      debugPrint("TimeOutException: $error");
      //CacheKeys.checkConnection(false);
      return _result({});
    } on SocketException catch (error) {
      debugPrint("SocketException: $error");
      //CacheKeys.checkConnection(false);
      return _result({});
    } catch (error) {
      debugPrint("Unexpected post error: $error");
      return _result({});
    }
  }

  Future<HttpResult> delete({required String slug, required Map<String, dynamic> body}) async {
    Uri url = Uri.parse("${AppConfig.baseUrl}/$slug");
    try {
      final response = await http.delete(
        url,
        body: jsonEncode(body),
      );
      return _result(response);
    } on TimeoutException catch (error) {
      debugPrint("TimeOutException: $error");
      //CacheKeys.checkConnection(false);
      return _result({});
    } on SocketException catch (error) {
      debugPrint("SocketException: $error");
      //CacheKeys.checkConnection(false);
      return _result({});
    } catch (error) {
      debugPrint("Unexpected post error: $error");
      return _result({});
    }
  }
}