

import 'package:flutter/material.dart';

import 'package:najottalim/pages/task3/task3_add_card.dart';

import 'package:najottalim/models/cards_model.dart';

class TaskThreePage extends StatefulWidget {
  const TaskThreePage({Key? key}) : super(key: key);

  @override
  State<TaskThreePage> createState() => _TaskThreePageState();
}

class _TaskThreePageState extends State<TaskThreePage> {
  List<CardsModel> _addedCards = [];

  List<CardsModel> get addedCards {
    return [..._addedCards];
  }

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
                MaterialPageRoute(builder: (context) => AddCard()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (ctx, i) => Container(
          height: 250,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.indigo,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 15, top: 15),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '1111 1111 1111 1111',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '11/23',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),

                    height: 30,
                    width: 60,
                    child: Image.asset(
                      'assets/uzcard.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 15),
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Karta Nomi',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
              Container(
                margin: EdgeInsets.all(15),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Palonchiev Pismadonchi',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
