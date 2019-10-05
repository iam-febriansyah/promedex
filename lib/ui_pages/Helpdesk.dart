import 'package:flutter/material.dart';
import 'package:promedex/ui_pages/Layout.dart';

class Helpdesk extends StatefulWidget {
  @override
  _HelpdeskState createState() => _HelpdeskState();
}

class _HelpdeskState extends State<Helpdesk> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: SizeConfig.blockVertical * 11.1,
              child: HeaderSection()
            ),
            Container(
              height: SizeConfig.blockVertical * 66,
              child: BodySection()
            )
          ]
        )
      )
    );
  }
}

class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 3.0),
            decoration: BoxDecoration(
              border: Border(
                // top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
              )
            ),
            width: SizeConfig.blockHorizontal * 100,
            child: Text(
              "Tell us your issue, Let us help : ", 
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15, 
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.only(top: 3.0),
            width: SizeConfig.blockHorizontal * 100,
            child: Row(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Card(
                      child: Container(
                        height: SizeConfig.blockVertical * 6,
                        width: SizeConfig.blockHorizontal * 31,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.blue[200]]
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Chat With Us",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15, 
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        )
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ]
                  ),
                ),
                Container(
                  child: Center(
                    child: Card(
                      child: Container(
                        height: SizeConfig.blockVertical * 6,
                        width: SizeConfig.blockHorizontal * 31,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.blue[200]]
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Email Us",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15, 
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        )
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ]
                  ),
                ),
                Container(
                  child: Center(
                    child: Card(
                      child: Container(
                        height: SizeConfig.blockVertical * 6,
                        width: SizeConfig.blockHorizontal * 31,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.blue[100]]
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Call Us",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15, 
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        )
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ]
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}

class BodySection extends StatefulWidget {
  @override
  _BodySectionState createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                // top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey.shade50),
              )
            ),
            alignment: Alignment.centerLeft,
            height: 50,
            child: ListTile(
              leading: Icon(Icons.ac_unit, color: Colors.amber,),
              title: Text('Frequently asked questions'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}