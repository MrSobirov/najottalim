import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task1_state.dart';

class Task1Cubit extends Cubit<Task1State> {
  Task1Cubit() : super(Task1Initial());
}
