part of 'task1_cubit.dart';

@immutable
abstract class Task1State {}

class Task1Loading extends Task1State {}

class Task1NoInternet extends Task1State {}

class Task1Loaded extends Task1State {
  final List<CountryModel> countries;
  Task1Loaded(this.countries);
}

class Task1Error extends Task1State {
  final String errorText;
  Task1Error({this.errorText = "Unknown error"});
}

