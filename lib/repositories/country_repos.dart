import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:najottalim/services/http_services.dart';

import '../models/countries_model.dart';

class CountryRepo {
  Future<List<CountryModel>> getCountriesAPI() async {
    final HttpResult response = await ApiRequests().get(slug: "https://najot-exam.free.mockoapp.net/countries");
    if(response.isSuccess) {
      try{
        return countryModelFromJson(jsonDecode(response.body)["data"]["countries"]);
      } catch(error, stacktrace) {
        debugPrint("$error, $stacktrace");
        return [];
      }
    } else {
      debugPrint("${response.status}");
      return [];
    }
  }
}