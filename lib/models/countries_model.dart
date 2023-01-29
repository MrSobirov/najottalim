import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

String countryToJson(Country data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    required this.data,
  });

  final Data data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.countries,
  });

  final List<Country> countries;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class Country {
  Country({
    required this.code,
    required this.name,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.emoji,
  });

  final String code;
  final String name;
  final String phone;
  final Continent continent;
  final String capital;
  final String currency;
  final String emoji;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    code: json["code"],
    name: json["name"],
    phone: json["phone"],
    continent: Continent.fromJson(json["continent"]),
    capital: json["capital"] ?? "",
    currency: json["currency"] ?? "",
    emoji: json["emoji"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "phone": phone,
    "continent": continent.toJson(),
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
    "name": name
  };
}
