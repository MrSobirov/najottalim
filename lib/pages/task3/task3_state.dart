part of 'task3_cubit.dart';

@immutable
abstract class Task3State {}

class Task3Loading extends Task3State {}

class Task3Loaded extends Task3State {
  final List<CardsModel> cards;
  Task3Loaded(this.cards);
}

class Task3Error extends Task3State {
  final String errorText;
  Task3Error({this.errorText = "Unknown error"});
}