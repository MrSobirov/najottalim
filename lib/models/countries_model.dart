import 'dart:convert';

List<CountryModel> countryModelFromJson(List str) => List<CountryModel>.from(str.map((x) => CountryModel.fromJson(x)));

List<Map<String, dynamic>> countryModelToJson(List<CountryModel> data) => List<Map<String, dynamic>>.from(data.map((x) => x.toJson()));

class CountryModel {
  CountryModel({
    required this.code,
    required this.name,
    required this.phone,
    required this.continentCode,
    required this.continentName,
    required this.capital,
    required this.currency,
    required this.emoji,
  });

  final String code;
  final String name;
  final String phone;
  final String continentCode;
  final String continentName;
  final String capital;
  final String currency;
  final String emoji;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    code: json["code"],
    name: json["name"],
    phone: json["phone"],
    continentCode: json["continent"] != null ? json["continent"]["code"] : json["continentCode"] ?? "",
    continentName: json["continent"] != null ? json["continent"]["name"] : json["continentName"] ?? "",
    capital: json["capital"] ?? "",
    currency: json["currency"] ?? "",
    emoji: json["emoji"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "phone": phone,
    "continentCode": continentCode,
    "continentName": continentName,
    "capital": capital,
    "currency": currency,
    "emoji": emoji,
  };
}

class Continent {
  Continent({
    required this.code,
    required this.name,
  });

  final String code;
  final String name;

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}
