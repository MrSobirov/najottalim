import 'package:flutter/material.dart';

import 'package:najottalim/models/countries_model.dart';

class CountryDetailsPage extends StatelessWidget {
  CountryModel data;
  CountryDetailsPage(this.data);
  TextStyle text() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              height: 270,
              width: double.infinity,
              child: Image.network(
                'https://www.worldatlas.com/r/w425/img/flag/${data.code.toLowerCase()}-flag.jpg',
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Country Name: ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Country code: ',
                        style: text(),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Capital of the Country: ',
                        style: text(),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Country\'s Currency: ',
                        style: text(),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Continent code: ',
                        style: text(),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Continent name: ',
                        style: text(),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Country emoji: ',
                        style: text(),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Country Prefix code: ',
                        style: text(),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // child: Container(
                  //   padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500, ),
                          softWrap: true,textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.code,
                          style: text(),
                          softWrap: true,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.capital,
                          style: text(),
                          softWrap: true,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.currency,
                          style: text(),
                          softWrap: true,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.continentCode,
                          style: text(),
                          softWrap: true,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.continentName,
                          style: text(),
                          softWrap: true,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.emoji,
                          style: text(),
                          softWrap: true,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '+${data.phone}',
                          style: text(),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
