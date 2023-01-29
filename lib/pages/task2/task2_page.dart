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
              return GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.cloud_download_outlined),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(files[index]["name"]),
                      SizedBox(height: 6.h,),
                      Container(
                        height: 8.h,
                        width: 280.w,
                        padding: EdgeInsets.only(top: 1,left: 2,bottom: 1),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey
                          ),
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(6)
                        ),

                        child: Row(
                          children: [
                            Container(
                              height: 4.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(6)
                              ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
      ),
    );
  }
}
