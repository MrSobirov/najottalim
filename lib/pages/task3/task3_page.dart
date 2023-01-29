import 'package:flutter/material.dart';
import 'package:najottalim/pages/task3/task3_add_card.dart';
import 'package:najottalim/pages/task3/task3_card.dart';

class TaskThreePage extends StatelessWidget {
  const TaskThreePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Task'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCard(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (ctx, i) => Task3Card(),
      ),
    );
  }
}
