import 'package:http/http.dart';
import 'package:promedex/HomeScreen.dart';
import 'package:promedex/blocs/auth/todoBlocLogin.dart';
import 'package:promedex/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' show Client;


class LogInScreen extends StatefulWidget {
  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen> with SingleTickerProviderStateMixin {
  Client client = Client();
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body:
      Center(
        child: ListView(
          shrinkWrap: true,
          reverse: false,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/img/logo.png',
                      height: 150.0,
                      width: 210.0,
                      fit: BoxFit.scaleDown,
                    )
                  ],
                ),
                Center(
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Form(
                            autovalidate: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: TextField(
                                    onChanged: blocLogin.updateEmail,
                                    controller: email_controller,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      labelText: 'User Name*',
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(right: 7.0),
                                        child:Image.asset(
                                          'assets/img/user_icon.png',
                                          height: 25.0,
                                          width: 25.0,
                                          fit: BoxFit.scaleDown,
                                        )
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    autofocus: false,
                                    controller: password_controller,
                                    decoration: InputDecoration(
                                      labelText: 'Password*',
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(right: 7.0),
                                        child: Image.asset(
                                            'assets/img/email_icon.png',
                                            height: 25.0,
                                            width: 25.0,
                                            fit: BoxFit.scaleDown,
                                          )
                                      )
                                    ),
                                    keyboardType: TextInputType.text,
                                  )
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0, top: 45.0, bottom: 20.0),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:BorderRadius.circular(30.0)
                                    ),
                                    onPressed: () {
                                      if (!(email_controller.value.text.trim().toString().length >1)) {
                                        Fluttertoast.showToast(
                                          msg: 'Please enter user name.',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIos: 1
                                        );
                                      } else if (!(password_controller.value.text.trim().toString().length >1)) {
                                        Fluttertoast.showToast(
                                          msg: 'Please enter the password.',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIos: 1
                                        );
                                      } else {
                                        blocLogin.checkLogin();
                                        Navigator.pushReplacement(
                                          context, MaterialPageRoute<HomeScreen>(
                                            builder: (BuildContext context) => HomeScreen(
                                              email_controller.value.text.toString()
                                            )
                                          )
                                        );
                                      }
                                    },

                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    color: Color(0xFF54C5F8),
                                    textColor: Colors.white,
                                    elevation: 5.0,
                                    padding: const EdgeInsets.only(
                                      left: 80.0,
                                      right: 80.0,
                                      top: 15.0,
                                      bottom: 15.0
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator
                                          .of(context)
                                          .pushNamed(SIGN_UP_SCREEN);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: Text(
                                          'Dont Have An Account',
                                          style: TextStyle(
                                            decoration:
                                            TextDecoration.underline,
                                            fontSize: 15.0
                                          ),
                                        )
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
  }
}
