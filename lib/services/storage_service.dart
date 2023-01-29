import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:najottalim/services/cache_values.dart';
import 'package:sqflite/sqflite.dart';

import '../models/countries_model.dart';

class StorageService {
  static List<Map> sqlResponse = [];
  Future<bool> getCountriesFromMemory() async {
    if(await databaseExists(CacheKeys.databasePath)) {
      try{
        Database database = await openDatabase(CacheKeys.databasePath);
        sqlResponse = await database.rawQuery("SELECT * FROM countries;");
        CachedModels.countries = countryModelFromJson(sqlResponse);
        return sqlResponse.isNotEmpty;
      } catch(error, stacktrace) {
        debugPrint("$error, $stacktrace");
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> writeCountriesToMemory(List<CountryModel> countries) async {
   try{
     Database database = await openDatabase(CacheKeys.databasePath);
     List<Map<String, dynamic>> countriesJson = countryModelToJson(countries);
     if((await database.rawQuery("SELECT * FROM sqlite_master WHERE name = 'countries' and type='table'")).isEmpty) {
       await database.execute("CREATE TABLE countries ("
           "code TEXT,"
           "name TEXT,"
           "phone TEXT,"
           "continentCode TEXT,"
           "continentName TEXT,"
           "capital TEXT,"
           "currency TEXT,"
           "emoji TEXT)");
     } else {
       database.delete('countries');
     }
     for(Map<String, dynamic> item in countriesJson) {
       database.insert('countries', item);
     }
     return true;
   } catch (error, stacktrace) {
     debugPrint("$error, $stacktrace");
     return false;
   }
  }
}