import 'package:flutter/cupertino.dart';
import 'package:najottalim/services/http_services.dart';

import '../models/cards_model.dart';

class CardsRepo {
  Future<List<CardsModel>> getCards() async {
    final HttpResult response = await ApiRequests().get(slug: "https://najottalim-aa473.firebaseio.com/cards/QW1gvCi1FclMg7aih2no");
    if(response.isSuccess) {
      return [];
    } else {
      debugPrint("${response.status}");
      return [];
    }
  }
  
}