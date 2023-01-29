import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najottalim/pages/task1/task1_page.dart';
import 'package:najottalim/pages/task2/task2_page.dart';
import 'package:najottalim/pages/task3/task3_page.dart';
import 'package:najottalim/services/cache_values.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentTabIndex = 0;
  List<BottomNavigationBarItem> navBarItems = [];
  final _kTabPages = [
    TaskOnePage(),
    TaskTwoPage(),
    TaskThreePage(),
  ];

  @override
  void initState() {
    super.initState();
    // checkConnectionFirst();
    navBarItems = <BottomNavigationBarItem>[
      customNavBarItem(Icon(Icons.map_sharp) , "Country"),
      customNavBarItem(Icon(Icons.folder) , "File"),
      customNavBarItem(Icon(Icons.add_card_outlined) , "Card"),
    ];
  }
  void changeTabs(int index, {bool langChanged = false}) {
    navBarItems = <BottomNavigationBarItem>[
      customNavBarItem(Icon(Icons.map_sharp) , "Country"),
      customNavBarItem(Icon(Icons.folder) , "File"),
      customNavBarItem(Icon(Icons.add_card_outlined) , "Card"),
    ];
    setState(() {
      _currentTabIndex = index;
    });
  }
  Future<void> checkConnectionFirst() async {
    checkConnection(true);
    //CacheKeys.checkConnection = checkConnection;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      debugPrint("ConnectivityResult => " + result.name.toString());
      CacheKeys.hasInternet = result.name.toString() == "none";
    });
  }

  void checkConnection(bool connection) async {
    if(connection) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult == ConnectivityResult.none){
       // MyDialogs().noInternet(context);
      }
    } else {
     // MyDialogs().noInternet(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.black12,
          showSelectedLabels: true,
          selectedFontSize: 11.sp,
          unselectedFontSize: 11.sp,
          items: navBarItems,
          currentIndex: _currentTabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) => changeTabs(index)
      ),
    );
  }


  BottomNavigationBarItem customNavBarItem(Widget icon, String label, {bool selected = false}) {
    return BottomNavigationBarItem(
        icon: icon,
        label: label
    );
  }

}