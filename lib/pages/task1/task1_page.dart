import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najottalim/models/countries_model.dart';
import 'package:najottalim/pages/task1/task1_cubit.dart';

import 'county_details.dart';
class TaskOnePage extends StatelessWidget {
  const TaskOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("API call va Caching"),
      ),
      body: BlocProvider(
          create: (context) => Task1Cubit()..getCountries(),
      child: BlocBuilder<Task1Cubit , Task1State>(
          builder: (cubitCTX , state) {
            if(state is Task1Loading) {
              return Center(child: CircularProgressIndicator(),);
            }
            else if(state is Task1Loaded) {
              return Container(
                  color: Colors.white,
                  height: 812.h,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await BlocProvider.of<Task1Cubit>(cubitCTX).updateCounties();
                    },
                    child: ListView.builder(
                        itemCount: state.countries.length,
                        itemBuilder: (context , index) {
                          CountryModel item = state.countries[index];
                          return GestureDetector(
                            onTap: ((){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  CountryDetailsPage(item)),
                              );
                              print("Fuck");
                            }),
                            child: ListTile(
                              title: Text(item.name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),),
                              subtitle: Text(item.capital),
                            ),
                          );
                        }),
                  ));
            }
            else if (state is Task1NoInternet) {
              return Center(child: Text("You do not have fucking network !!!"),);
            }
            else if (state is Task1Error) {
              return Center(child: Text("Task1Error on"),);
            }
            else {
              return Center(child: Text("Seen"),);
            }
          }),)

    );
  }
}
