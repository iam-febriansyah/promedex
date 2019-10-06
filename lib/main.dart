import 'dart:async';

import 'package:promedex/Constant.dart';
import 'package:promedex/SplashScreen.dart';
import 'package:promedex/LoginScreen.dart';
import 'package:promedex/SignUpScreen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        LOGIN_SCREEN: (BuildContext context) => LogInScreen(),
        SIGN_UP_SCREEN: (BuildContext context) => SignUpScreen(),
        ANIMATED_SPLASH: (BuildContext context) => SplashScreen()
      },
    );
  }
}