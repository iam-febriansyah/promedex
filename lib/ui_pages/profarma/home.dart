import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:promedex/blocs/profarma/todoBlocHomeProFarma.dart';
import 'package:promedex/models/profarma/todoHomeProFarmaModels.dart';
import 'package:promedex/ui_pages/Layout.dart';
import 'package:promedex/ui_pages/profarma/singlePage.dart';

class HomeProFarma extends StatefulWidget {
  @override
  _HomeProFarmaState createState() => _HomeProFarmaState();
}

class _HomeProFarmaState extends State<HomeProFarma> {
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 1.0, right: 1.0, top: 5.0, bottom: 5.0) ,
          child: TextField(
            // onChanged: onTextChange,
            decoration: InputDecoration(
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search something ...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              contentPadding: EdgeInsets.zero
            )
          )
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
      
      body: ListData()
    );
  }

  
}

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  void initState() { 
    blocHomeProFarma.fetchAllTodo(); 
    super.initState();
  }
  void disopose(){
    blocHomeProFarma.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: blocHomeProFarma.allTodo,
      builder: (BuildContext context, AsyncSnapshot<List<TodoHomeProFarma>> snapshot) {
        if(snapshot.hasData){
          print(snapshot.data.length);
          return ListDataColumn(snapshot);
        }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }

  Widget ListDataColumn(AsyncSnapshot<List<TodoHomeProFarma>> snapshot){
    SizeConfig().init(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          leading: Container(),
          expandedHeight: MediaQuery.of(context).size.height / 100,
          flexibleSpace: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Populer',
                        style: TextStyle(
                          fontSize: 14, 
                          color: Colors.black87
                        )
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Terlaris',
                        style: TextStyle(
                          fontSize: 14, 
                          color: Colors.black87
                        )
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(

                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Terbaru',
                        style: TextStyle(
                          fontSize: 14, 
                          color: Colors.black87
                        )
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Harga',
                        style: TextStyle(
                          fontSize: 14, 
                          color: Colors.black87
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.height / 1300,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final TodoHomeProFarma putData = snapshot.data[index];
              return Container(
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute<SinglePage>(builder: (BuildContext context) {
                      return SinglePage(
                        todo: snapshot.data[index]
                      );
                    }));
                  },
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          // margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                snapshot.data[index].image,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshot.data[index].title,
                                style: TextStyle(
                                  fontSize: 14, 
                                )
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Rp.' + 
                                    snapshot.data[index].harga,
                                    style: TextStyle(
                                      fontSize: 13, 
                                      color: Colors.red
                                    )
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('291 terjual',
                                    style: TextStyle(
                                      fontSize: 11, 
                                      color: Colors.black87
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                          
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: snapshot.data.length,
          ),
        )
      ]
    );
  }
}