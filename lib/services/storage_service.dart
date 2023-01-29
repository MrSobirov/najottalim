import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:najottalim/services/cache_values.dart';
import 'package:sqflite/sqflite.dart';

import '../models/countries_model.dart';

class StorageService {
  Future<bool> getCountriesFromMemory() async {
    if(await databaseExists(CacheKeys.databasePath)) {
      try{
        Database database = await openDatabase(
            CacheKeys.databasePath,
            version: 1,
            onCreate: (Database db, int version) async {
              // When creating the db, create the table
              await db.execute(
                  'CREATE TABLE countries (country varchar(255))');
            }
        );
        List<Map> sqlResponse = await database.rawQuery('SELECT * FROM countries');
        CachedModels.countries = countryModelFromJson({"data": {"country": sqlResponse.toString()}}.toString());
        return true;
      } catch(error, stacktrace) {
        debugPrint("$error, $stacktrace");
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> writeCountriesToMemory(CountryModel countries) async {
   try{
     Database database = await openDatabase(CacheKeys.databasePath);
     database.delete('countries');
     for(Country item in countries.data.countries) {
       database.insert('countries', {"country": countryToJson(item)});
     }
     return true;
   } catch (error, stacktrace) {
     debugPrint("$error, $stacktrace");
     return false;
   }
  }
}