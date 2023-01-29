import 'package:flutter/cupertino.dart';
import 'package:najottalim/services/http_services.dart';

import '../models/countries_model.dart';

class CountryRepo {
  Future<CountryModel?> getCountriesAPI() async {
    final HttpResult response = await ApiRequests().get(slug: "https://najot-exam.free.mockoapp.net/countries");
    if(response.isSuccess) {
      try{
        return countryModelFromJson(response.body);
      } catch(error, stacktrace) {
        debugPrint("$error, $stacktrace");
        return null;
      }
    } else {
      debugPrint("${response.status}");
      return null;
    }
  }
}