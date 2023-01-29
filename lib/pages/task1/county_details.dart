import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najottalim/models/countries_model.dart';
class CountryDetailsPage extends StatelessWidget {
  CountryModel data;
  CountryDetailsPage(this.data);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Country Details"),
      ),
      body: Container(
        height: 812.h,
        color: Colors.white,
        child: Center(
          child: Text(data.continentName),
        ),
      ),
    );
  }
}
