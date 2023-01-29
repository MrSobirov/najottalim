import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:najottalim/services/cache_values.dart';
import 'package:najottalim/services/http_services.dart';
import 'package:najottalim/services/utils.dart';

import '../models/cards_model.dart';

class CardsRepo {
  String firebaseUrl = "https://najottalim-aa473-default-rtdb.firebaseio.com/cards.json";
  Future<List<CardsModel>> getCards() async {
    final HttpResult response = await ApiRequests().get(url: firebaseUrl);
    if(response.isSuccess) {
      try{
        print(response.body);
        return cardsModelFromJson(jsonDecode(response.body)["cards"]);
      } catch(error, stacktrace) {
        debugPrint("$error, $stacktrace");
        return [];
      }
    } else {
      debugPrint("${response.status}");
      return [];
    }
  }

  Future<List<CardsModel>> addCard(Map<String, dynamic> newCard) async {
    CachedModels.cards.add(cardToJson(newCard));
    final HttpResult response = await ApiRequests().post(
      url: "https://najottalim-aa473.firebaseio.com/cards/QW1gvCi1FclMg7aih2no",
      body: {
        "cards": cardsModelToJson(CachedModels.cards)
      }
    );
    if(!response.isSuccess) {
      MyWidgets().showToast("Error occurred try again later");
    }
    return getCards();
  }

  Future<List<CardsModel>> updateCard(Map<String, dynamic> updatingCardData) async {
    CardsModel updatingCard = cardToJson(updatingCardData);
    CachedModels.cards.removeWhere((element) => element.cardId == updatingCard.cardId);
    CachedModels.cards.add(updatingCard);
    final HttpResult response = await ApiRequests().post(
        url: "https://najottalim-aa473.firebaseio.com/cards/QW1gvCi1FclMg7aih2no",
        body: {
          "cards": cardsModelToJson(CachedModels.cards)
        }
    );
    if(!response.isSuccess) {
      MyWidgets().showToast("Error occurred try again later");
    }
    return getCards();
  }

  Future<List<CardsModel>> deleteCard(String deletingCardID) async {
    CachedModels.cards.removeWhere((element) => element.cardId == deletingCardID);
    final HttpResult response = await ApiRequests().post(
        url: "https://najottalim-aa473.firebaseio.com/cards/QW1gvCi1FclMg7aih2no",
        body: {
          "cards": cardsModelToJson(CachedModels.cards)
        }
    );
    if(!response.isSuccess) {
      MyWidgets().showToast("Error occurred try again later");
    }
    return getCards();
  }
}