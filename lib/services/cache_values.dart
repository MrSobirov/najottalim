import 'package:najottalim/models/countries_model.dart';

class CacheKeys{
  static String databasePath = 'data/data/com.ultrainha.najottalim/databases/task1.db';
  static bool hasInternet = false;
}

class CachedModels {
  static CountryModel? countries;
  static List<Map> sqlCountriesData = [];
}