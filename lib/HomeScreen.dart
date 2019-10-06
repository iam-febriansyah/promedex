import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:promedex/constant.dart';
import 'package:promedex/ui_pages/Account.dart';
import 'package:promedex/ui_pages/Helpdesk.dart';
import 'package:promedex/ui_pages/Home.dart';
import 'package:promedex/ui_pages/Inbox.dart';
import 'package:promedex/ui_pages/Medrec.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.userName);
  String userName;
  @override
  _HomeScreenState createState() => _HomeScreenState(); 
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: Text('Promedex'),
        backgroundColor: Colors.lightBlue,
        leading: Icon(Icons.view_list),
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
            icon: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
              },
              child: Icon(Icons.account_circle, color: Colors.lightBlue),
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
              },
              child: Text(
                'Account', 
                style: TextStyle(
                  color: Colors.lightBlue
                )
              )
            ),
            
          ), 
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
