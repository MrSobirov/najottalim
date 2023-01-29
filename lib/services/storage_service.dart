import 'package:flutter/foundation.dart';
import 'package:najottalim/services/cache_values.dart';

import '../models/countries_model.dart';

class StorageService {
  Future<bool> getCountriesFromMemory() async {
    String sqlResponse = "aaa";
    try{
      CachedModels.countries = countryModelFromJson(sqlResponse);
      return true;
    } catch(error, stacktrace) {
      debugPrint("$error, $stacktrace");
      return false;
    }

  }

  Future<bool> writeCountriesToMemory(CountryModel countries) async {
    return true;
  }
}