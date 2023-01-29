import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCard extends StatefulWidget {
  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String _defaultDropDownValue = 'Uzcard';
  var items = [
    'Uzcard',
    'Humo',
  ];

  Widget TextFieldDecoration() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 1, color: Colors.black54),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding a Card'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Colors.indigo,
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.amber,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextFieldDecoration(),
            TextFieldDecoration(),
            TextFieldDecoration(),
            TextFieldDecoration(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: Colors.black54)),
              child: DropdownButton(
                  isExpanded: true,
                  value: _defaultDropDownValue,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _defaultDropDownValue = newValue!;
                    });
                  }),
            ),
            Container(
              height: 50.h,
              width: 280.w,
              child: ElevatedButton(
                  onPressed: (() async {
                    final  response = await http.post(
                        Uri.parse('https://najottalim-aa473-default-rtdb.firebaseio.com/cards.json'),
                        body: jsonEncode(
                            {
                              "cardID": UniqueKey(),
                              "cardName": "",
                              "cardNumber": "",
                              "expireDate": "",
                              "gradientID": "",
                              "type": _defaultDropDownValue == "Uzcard"
                            }
                        )
                    );
                    print(response.body);
                  }), child: Text("Add")),
            )
          ],
        ),
      ),
    );
  }
}
