import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CountryDetailsPage extends StatelessWidget {
  const CountryDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Country Details"),
      ),
      body: Container(
        height: 812.h,
        color: Colors.white,
      ),
    );
  }
}
