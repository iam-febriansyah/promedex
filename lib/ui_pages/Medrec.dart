import 'package:flutter/material.dart';
import 'package:promedex/ui_pages/Layout.dart';

class Medrec extends StatefulWidget {
  @override
  _MedrecState createState() => _MedrecState();
}

class _MedrecState extends State<Medrec> {
  double _initTextHeight;
  double _height;

  void initState(){
    _initTextHeight = 10;
    _height = _initTextHeight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      // top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey.shade100),
                    )
                  ),
                  child: Text(
                    "Personal Medical Record", 
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
              )
            ),
            ProfileSection(),
            ListSection(),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  // const ProfileSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        flex: 2,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.white30]
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: SizeConfig.blockHorizontal * 20,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                "assets/img/ProCheck.png",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: SizeConfig.blockHorizontal * 57,
                          child: Container(
                            margin: EdgeInsets.only(left: 2.0),
                            padding: EdgeInsets.only(top: 2.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Denny Mappaaaaa",
                                    style: TextStyle(
                                      fontSize: 15, 
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Denny@gmail.com",
                                    style: TextStyle(
                                      fontSize: 10, 
                                    )
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "+6280197201264",
                                    style: TextStyle(
                                      fontSize: 10, 
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.blockHorizontal * 20,
                          child: Container(
                            child: Container(
                              height: SizeConfig.blockVertical * 3.5,
                              child: RaisedButton(
                                onPressed: () {},
                                padding: const EdgeInsets.all(0.0),
                                color: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text(
                                  "Edit Profile", 
                                  style: TextStyle(
                                    color: Colors.white, 
                                    fontSize: 10.0
                                  )
                                ),
                              )
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                ),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ]
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class ListSection extends StatelessWidget {
  // const ListSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 12,
      child: Container(
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
                leading: Icon(Icons.ac_unit),
                title: Text('Medical Record'),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
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
                leading: Icon(Icons.ac_unit),
                title: Text('Hasil MCU'),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
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
                leading: Icon(Icons.ac_unit),
                title: Text('Hasil Laboratorium'),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
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
                leading: Icon(Icons.ac_unit),
                title: Text('Hasil Penunjang'),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
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
                leading: Icon(Icons.ac_unit),
                title: Text('SOAP Rawat Jalan'),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
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
                leading: Icon(Icons.ac_unit),
                title: Text('E-Resep'),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
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
                leading: Icon(Icons.ac_unit),
                title: Text('Laporan Home Care'),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





