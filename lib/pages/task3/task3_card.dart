import 'package:flutter/material.dart';

class Task3Card extends StatefulWidget {
  const Task3Card({Key? key}) : super(key: key);

  @override
  State<Task3Card> createState() => _Task3CardState();
}

class _Task3CardState extends State<Task3Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 250,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Colors.indigo,
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Falonchiyev Pismadonchi'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
