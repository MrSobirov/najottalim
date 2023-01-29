import 'package:najottalim/models/countries_model.dart';

import '../models/cards_model.dart';

class CacheKeys{
  static bool hasInternet = false;
  static var checkConnection;
  static String databasePath = 'data/data/com.ultrainha.najottalim/databases/task1.db';
}

class CachedModels {
  static List<CountryModel> countries = [];
  static List<Map> sqlCountriesData = [];
  static List<CardsModel> cards = [];
}