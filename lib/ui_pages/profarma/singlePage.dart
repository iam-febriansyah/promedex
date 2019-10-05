import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:promedex/models/profarma/todoHomeProFarmaModels.dart';
import 'package:promedex/ui_pages/Layout.dart';

class SinglePage extends StatefulWidget {
  final TodoHomeProFarma todo;
  const SinglePage({Key key, this.todo}) : super(key: key);
  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 1.0, right: 1.0, top: 5.0, bottom: 5.0) ,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.todo.title,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 50, 
              )
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Badge(
              animationType: BadgeAnimationType.scale,
              child: const Icon(
                Icons.shopping_cart
              )
            ),
            onPressed: () {},
          ),
        ],
      ),
      
      body: ListData(data: widget.todo ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.orangeAccent,
          primaryColor: Colors.white,
          textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(
              caption: TextStyle(
                color: Colors.white
              )
            )
          ), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Masukkan Keranjang'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              title: Text('Beli Sekarang'),
            )
          ],
        ),
      ),
    );
  }

  
}

class ListData extends StatefulWidget {
  final TodoHomeProFarma data;
  const ListData({Key key, this.data}) : super(key: key);
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.2,
                        ),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          widget.data.image,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.data.title,
                            style: TextStyle(
                              fontSize: 18, 
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Rp.' +
                              widget.data.harga,
                              style: TextStyle(
                                fontSize: 18, 
                                color: Colors.red
                              )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              widget.data.harga + ' Terjual',
                              style: TextStyle(
                                fontSize: 13, 
                                color: Colors.grey
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                          'Deskripsi Produk',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17, 
                            )
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.2,
                              ),
                            )
                          )
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.data.deskripsi,
                            style: TextStyle(
                              fontSize: 16, 
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]
    );
  }
}