import 'package:najottalim/services/http_services.dart';

import '../models/cards_model.dart';

class CardsRepo {
  Future<CardsModel?> getCards() async {
    final HttpResult response = await ApiRequests().get(slug: "https://najottalim-50487-default-rtdb.firebaseio.com//cards/QW1gvCi1FclMg7aih2no");
  }
  
}