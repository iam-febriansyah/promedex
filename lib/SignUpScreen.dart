import 'package:promedex/constant.dart';
import 'package:promedex/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpScreen>
  with SingleTickerProviderStateMixin {
  final TextEditingController name_controller =  TextEditingController();
  final TextEditingController password_controller =  TextEditingController();
  final TextEditingController email_controller =  TextEditingController();
  final TextEditingController re_password_controller =
       TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomPadding: true,
        body:  ListView(
          shrinkWrap: true,
          reverse: false,
          children: <Widget>[
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child:  Row(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.of(context).pop(SIGN_UP_SCREEN);
                                }
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0, bottom: 0.0, top: 0.0),
                            child:  Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.left
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Image.asset(
                      'assets/img/logo.png',
                      height: 100.0,
                      width: 220.0,
                      fit: BoxFit.scaleDown,
                    )
                  ],
                ),
                Center(
                  child: Center(
                    child:  Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                            child:  Form(
                              autovalidate: false,
                              child:  Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    child:  TextFormField(
                                      controller: name_controller,
                                      decoration:  InputDecoration(
                                        labelText: 'Full Name*',
                                        filled: false,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(right: 7.0),
                                            child: Image.asset(
                                              'assets/img/user_icon.png',
                                              height: 25.0,
                                              width: 25.0,
                                              fit: BoxFit.scaleDown,
                                            )
                                        )
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                                    child:  TextFormField(
                                      obscureText: false,
                                      controller: email_controller,
                                      decoration:  InputDecoration(
                                        labelText: 'Email-Id',
                                        enabled: true,
                                        filled: false,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(right: 7.0),
                                          child:  Image.asset(
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
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                                    child:  TextFormField(
                                      obscureText: true,
                                      controller: password_controller,
                                      decoration:  InputDecoration(
                                        labelText: 'Password*',
                                        enabled: true,
                                        filled: false,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(right: 7.0),
                                          child: Image.asset(
                                            'assets/img/password_icon.png',
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
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: re_password_controller,
                                      decoration:  InputDecoration(
                                        labelText: 'Confirm Password*',
                                        enabled: true,
                                        filled: false,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(right: 7.0),
                                          child: Image.asset(
                                            'assets/img/password_icon.png',
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
                                      if (!(name_controller.value.text.toString().trim().isNotEmpty)){
                                        Fluttertoast.showToast(
                                          msg: 'Please enter user name.',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIos: 1
                                        );
                                      } else if (!(password_controller.value.text.toString().trim().isNotEmpty)) {
                                        Fluttertoast.showToast(
                                          msg: 'Please enter the password.',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIos: 1
                                        );
                                      } else if (!(re_password_controller.value.text.toString().trim().isNotEmpty)){
                                        Fluttertoast.showToast(
                                          msg: 'Please enter the confirm password.',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIos: 1
                                        );
                                      } else {
                                        if (re_password_controller.value.text.toString().endsWith(password_controller.value.text.toString())) {
                                          final MaterialPageRoute<HomeScreen> root = MaterialPageRoute<HomeScreen>(
                                              builder: (BuildContext context) =>
                                                HomeScreen(name_controller.value.text.toString()
                                              )
                                          );
                                          Navigator.of(context).pop(LOGIN_SCREEN);
                                          Navigator.pushReplacement(context, root);
                                        } else {
                                          Fluttertoast.showToast(
                                            msg:'Your Password and confirm password do not match.',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIos: 1
                                          );
                                        }
                                      }
                                    },
                                    child:  Text(
                                      'SignUp ',
                                      style:  TextStyle(
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
        )
      );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    name_controller.dispose();
    password_controller.dispose();
    email_controller.dispose();
    re_password_controller.dispose();
    super.dispose();
  }
}
