import 'dart:convert';

List<CardsModel> cardsModelFromJson(List cards) => List<CardsModel>.from(cards.map((x) => CardsModel.fromJson(x)));

List cardsModelToJson(List<CardsModel> data) => List.from(data.map((x) => x.toJson()));

CardsModel cardToJson(Map<String, dynamic> item) => CardsModel.fromJson(item);

class CardsModel {
  CardsModel({
    required this.cardId,
    required this.cardNumber,
    required this.expireDate,
    required this.gradient,
    required this.moneyAmount,
    required this.owner,
    required this.type,
    required this.userId,
  });

  final String cardId;
  final String cardNumber;
  final String expireDate;
  final int gradient;
  final int moneyAmount;
  final String owner;
  final bool type;
  final String userId;

  factory CardsModel.fromJson(Map<String, dynamic> json) => CardsModel(
    cardId: json["cardID"],
    cardNumber: json["cardNumber"],
    expireDate: json["expireDate"],
    gradient: json["gradient"],
    moneyAmount: json["moneyAmount"],
    owner: json["owner"],
    type: json["type"],
    userId: json["userID"],
  );

  Map<String, dynamic> toJson() => {
    "cardID": cardId,
    "cardNumber": cardNumber,
    "expireDate": expireDate,
    "gradient": gradient,
    "moneyAmount": moneyAmount,
    "owner": owner,
    "type": type,
    "userID": userId,
  };
}
