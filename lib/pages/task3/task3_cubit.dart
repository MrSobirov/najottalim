import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:najottalim/models/cards_model.dart';
import 'package:najottalim/repositories/cards_repos.dart';

import '../../services/cache_values.dart';
import '../../services/utils.dart';

part 'task3_state.dart';

class Task3Cubit extends Cubit<Task3State> {
  Task3Cubit() : super(Task3Loading());

  Future<void> getCards() async {
    if(CachedModels.cards.isEmpty) {
      updateScreen(updatingWithData: false);
    }
  }

  Future<void> updateScreen({bool updatingWithData = true}) async {
    if(CacheKeys.hasInternet) {
      emit(Task3Loading());
      CachedModels.cards = await CardsRepo().getCards();
      emit(Task3Loaded(CachedModels.cards));
    } else {
      if(updatingWithData) {
        MyWidgets().showToast("No internet! Connect and try again!!!");
      }
    }
  }
}
