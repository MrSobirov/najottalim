import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTwoPage extends StatelessWidget {
  const TaskTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String , dynamic>> files = [
      {
        "link" : "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        "name" : "Flutter - book"
      },
      {
        "link" : "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        "name" : "Java - book"
      },
      {
        "link" : "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        "name" : "PHP - book"
      },
      {
        "link" : "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        "name" : "Android - book"
      },
      {
        "link" : "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        "name" : "Swift - book"
      },
      {
        "link" : "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        "name" : "Python - book"
      },
    ];
    return  Scaffold(
      appBar: AppBar(
        title: Text("File Download"),
      ),
      body: Container(
        height: 812.h,
        color: Colors.white,
        child: ListView.builder(
            itemCount: files.length,
            itemBuilder: (context , index) {
              return ListTile(
                leading: IconButton(
                  onPressed: ((){

                  }),
                  icon: Icon(Icons.cloud_download_outlined),
                ),
                title: Text(files[index]["name"]),
                subtitle: Container(
                  height: 10.h,
                  width: 280.w,
                  color: Colors.black,
                  child: Container(
                    height: 10.h,
                    width: 170.w,
                    color: Colors.blue,
                  ),
                ),

              );
            })
      ),
    );
  }
}
