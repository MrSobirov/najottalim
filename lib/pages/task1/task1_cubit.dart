import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:najottalim/models/countries_model.dart';
import 'package:najottalim/repositories/country_repos.dart';
import 'package:najottalim/services/cache_values.dart';
import 'package:najottalim/services/storage_service.dart';
import 'package:najottalim/services/utils.dart';

part 'task1_state.dart';

class Task1Cubit extends Cubit<Task1State> {
  Task1Cubit() : super(Task1Loading());

  Future<void> getCountries() async {
    if(CachedModels.countries.isEmpty) {
      if(!(await StorageService().getCountriesFromMemory())) {
        updateCounties(update: false);
      } else {
        emit(Task1Loaded(CachedModels.countries));
      }
    }
  }
  
  Future<void> updateCounties({bool update = true}) async {
    if(CacheKeys.hasInternet) {
      CachedModels.countries = await CountryRepo().getCountriesAPI();
      if(CachedModels.countries.isNotEmpty) {
        StorageService().writeCountriesToMemory(CachedModels.countries);
        emit(Task1Loaded(CachedModels.countries));
      } else {
        emit(Task1Error(errorText: "Cannot get data from api"));
      }
    } else {
      if(update) {
        MyWidgets().showToast("No internet! Connect and try again!!!");
      }
    }
  }
}
