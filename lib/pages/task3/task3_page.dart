import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najottalim/pages/task3/task3_cubit.dart';

class TaskThreePage extends StatefulWidget {
  const TaskThreePage({Key? key}) : super(key: key);

  @override
  State<TaskThreePage> createState() => _TaskThreePageState();
}

class _TaskThreePageState extends State<TaskThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ElevatedButton(
          child: Text("Cards details"),
          onPressed: (() async {

          }),
        ),
      ),
    );
  }
}
