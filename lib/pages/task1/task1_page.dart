import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'county_details.dart';
class TaskOnePage extends StatelessWidget {
  const TaskOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("API call va Caching"),
      ),
      body: Container(
        color: Colors.white,
        height: 812.h,
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context , index) {
              return GestureDetector(
                onTap: ((){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CountryDetailsPage()),
                  );
                  print("Fuck");
                }),
                child: ListTile(
                  title: Text("Uzbekistan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),),
                  subtitle: Text("Tashkent"),
                ),
              );
            })),

    );
  }
}
