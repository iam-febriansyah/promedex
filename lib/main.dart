import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:promedex/ui_pages/Account.dart';
import 'package:promedex/ui_pages/Helpdesk.dart';
import 'package:promedex/ui_pages/Home.dart';
import 'package:promedex/ui_pages/Inbox.dart';
import 'package:promedex/ui_pages/Medrec.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto'
      ),
      home: MyHomePage(
        title: 'Promedex',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, String username}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(); 
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<StatefulWidget> _layoutPage = [
    Home(),
    Medrec(),
    Helpdesk(),
    Inbox(),
    Account()
  ];

  void _onTabItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: Icon(Icons.view_list),
        title: Text(
          widget.title, 
          style: TextStyle(
            fontFamily: 'Seasrn'
          )
        ),
        actions: <Widget>[
          IconButton(
            icon: Badge(
              badgeContent: Text(
                '3',
                style: TextStyle(color: Colors.white70)
              ),
              animationType: BadgeAnimationType.scale,
              child: const Icon(
                Icons.shopping_cart
              )
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.lightBlue),
            title: Text('Home', style: TextStyle(color: Colors.lightBlue))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital, color: Colors.lightBlue),
            title: Text('MedRec', style: TextStyle(color: Colors.lightBlue))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help, color: Colors.lightBlue),
            title: Text('Hepdesk', style: TextStyle(color: Colors.lightBlue))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.lightBlue),
            title: Text('Inbox', style: TextStyle(color: Colors.lightBlue))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.lightBlue),
            title: Text('Account', style: TextStyle(color: Colors.lightBlue))
          ), 
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
