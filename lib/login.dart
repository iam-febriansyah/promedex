import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:promedex/main.dart';

void main() => runApp(MyApp());

String username='';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login PHP My Admin',     
      home: LoginPage(),
      routes: <String,WidgetBuilder>{
        '/main': (BuildContext context)=> MyHomePage(username: username,),
        '/main': (BuildContext context)=> MyHomePage(username: username,),
        '/LoginPage': (BuildContext context)=> LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

TextEditingController user=TextEditingController();
TextEditingController pass=TextEditingController();

String msg='';

Future<List> _login() async {
  final http.Response response = await http.post('http://10.0.2.2/my_store/login.php', body: {
    'username': user.text,
    'password': pass.text,
  });

  final dynamic datauser = json.decode(response.body);

  if(datauser.length==0){
    setState(() {
          msg='Login Fail';
        });
  }else{
    if(datauser[0]['level']=='admin'){
       Navigator.pushReplacementNamed(context, '/main');
    }else if(datauser[0]['level']=='member'){
      Navigator.pushReplacementNamed(context, '/main');
    }

    setState(() {
          username= datauser[0]['username'];
        });

  }

  return datauser;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Username',style: TextStyle(fontSize: 18.0),),
              TextField(   
                controller: user,                
                decoration: InputDecoration(
                  hintText: 'Username'
                ),           
                ),
              Text('Password',style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: pass,  
                obscureText: true,                
                 decoration: InputDecoration(
                  hintText: 'Password'
                ),                
                ),
              
              RaisedButton(
                child: Text('Login'),
                onPressed: (){
                  _login();
                },
              ),

              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)
             

            ],
          ),
        ),
      ),
    );
}
}