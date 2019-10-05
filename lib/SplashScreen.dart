import 'dart:async';

import 'package:flutter/material.dart';
import 'package:promedex/main.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 5), onDoneLoading);
  }

  dynamic onDoneLoading() async {
    Navigator.of(context)
      .push(MaterialPageRoute<MyHomePage>(
        builder: (BuildContext context) {
          return MyHomePage();
        }
      ));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }
}