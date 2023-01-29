import 'package:flutter/material.dart';
import 'main_page.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigatorHome();
  }

  _navigatorHome() async {
    Future.delayed(Duration(milliseconds: 3000), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => MainPage()));

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/iut-logo.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}