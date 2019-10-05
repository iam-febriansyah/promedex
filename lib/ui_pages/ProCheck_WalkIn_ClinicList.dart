import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:promedex/blocs/todoKlinik.dart';
import 'package:promedex/models/todoKlinikModels.dart';
import 'package:promedex/ui_pages/Layout.dart';

class ProCheckWalkIn extends StatefulWidget {
  @override
  _ProCheckWalkInState createState() => _ProCheckWalkInState();
}

class _ProCheckWalkInState extends State<ProCheckWalkIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Walk In ProCheck'),
        actions: <Widget>[
          IconButton(
            icon: Badge(
              animationType: BadgeAnimationType.scale,
              child: const Icon(
                Icons.search
              )
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
        ],
      ),
      
      body: Container(
        child: new ScrollingView(),
      ),
    );
  }
}


class ScrollingView extends StatefulWidget {
  @override
  _ScrollingViewState createState() => _ScrollingViewState();
}

class _ScrollingViewState extends State<ScrollingView> {
  @override
  void initState() { 
    blocKlinik.fetchAllTodo(); 
    super.initState();
  }
  void disopose(){
    blocKlinik.dispose();
    super.dispose();
  }
  @override
  //List<TodoKlinik>
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 50) / 3;
    final double itemWidth = size.width / 2;

    return StreamBuilder<List<TodoKlinik>>(
      stream: blocKlinik.allTodo,
      builder: (BuildContext context, snapshot) {
        return snapshot.hasData ?
          CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: (itemWidth / itemHeight),
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: SizeConfig.blockVertical * 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  snapshot.data[index].gambar,
                                ),
                              ),
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            height: SizeConfig.blockVertical * 20,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    snapshot.data[index].nama,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 14, 
                                    )
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Rp. ' + snapshot.data[index].harga.toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 11, 
                                    )
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    snapshot.data[index].alamat.toString(),
                                    style: TextStyle(
                                      fontSize: 11, 
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  );
                  // return ListTile(
                  //   title: Text(snapshot.data[index].id.toString()),
                  // );
                }, childCount: snapshot.data.length),
              )
            ],
        ): 
        Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}
