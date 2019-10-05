import 'package:flutter/material.dart';
import 'package:promedex/blocs/todoBloc.dart';
import 'package:promedex/blocs/todoNews.dart';
import 'package:promedex/models/todoNewsModels.dart';
import 'package:promedex/models/todoSliderModels.dart';
import 'package:promedex/ui_pages/Layout.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:promedex/ui_pages/profarma/home.dart';

import 'ProCheck_WalkIn_ClinicList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                SliderSection(),
              ],
            ),
          ),
          
          MenuSection(),

          SliverFixedExtentList(
            itemExtent: SizeConfig.blockVertical * 100,
            delegate: SliverChildListDelegate(
              [
                NewsSection(),
              ],
            ),
          ),
          
        ],
      )
    );
  }
}

class MenuSection extends StatefulWidget {
  @override
  _MenuSectionState createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  void _modalBottomSheetMenu(){
    showModalBottomSheet<MenuSection>(
      backgroundColor: Colors.transparent,
      context: context, builder: (builder){
        return Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular( 16.0)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 9.0,
              ),
            ]
          ),
          // color: Colors.red,
          margin: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
          height: SizeConfig.blockVertical * 20.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute<MenuSection>(builder: (BuildContext context) {
                      return ProCheckWalkIn();
                    }));
                  },
                  child: Card(
                    child: Container(
                      height: SizeConfig.blockVertical * 6,
                      width: SizeConfig.blockHorizontal * 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.blue[300]],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6.5,
                          ),
                        ]
                      ),
                      child: Center(
                        child: Text(
                          'Walk In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15, 
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute<MenuSection>(builder: (BuildContext context) {
                      return ProCheckWalkIn();
                    }));
                  },
                  child: Card(
                    child: Container(
                      height: SizeConfig.blockVertical * 6,
                      width: SizeConfig.blockHorizontal * 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.blue[300]],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6.5,
                          ),
                        ]
                      ),
                      child: Center(
                        child: Text(
                          'Chat Online',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15, 
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SliverGrid.count(
      crossAxisCount: 4,
      children: [
        Container(
          height: SizeConfig.blockVertical * 20,
          child: GestureDetector(
            onTap: (){
              _modalBottomSheetMenu();
            },
            child: Container(
              width: SizeConfig.blockHorizontal * 25,
              height: SizeConfig.blockVertical * 11,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset(
                              'assets/img/ProCheck.png',
                              width: SizeConfig.blockHorizontal * 15,
                              height: SizeConfig.blockVertical * 15,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text('ProCheck', style: TextStyle(fontSize: SizeConfig.blockVertical * 1.2),),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),

        Container(
          height: SizeConfig.blockVertical * 20,
          child: GestureDetector(
            onTap: (){
              _modalBottomSheetMenu();
            },
            child: Container(
              width: SizeConfig.blockHorizontal * 25,
              height: SizeConfig.blockVertical * 11,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset(
                              'assets/img/ProLab.png',
                              width: SizeConfig.blockHorizontal * 15,
                              height: SizeConfig.blockVertical * 15,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text('ProLab', style: TextStyle(fontSize: SizeConfig.blockVertical * 1.2),),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),

        Container(
          height: SizeConfig.blockVertical * 20,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .push(MaterialPageRoute<MenuSection>(builder: (BuildContext context) {
                return HomeProFarma();
              }));
            },
            child: Container(
              width: SizeConfig.blockHorizontal * 25,
              height: SizeConfig.blockVertical * 11,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset(
                              'assets/img/ProFarma.png',
                              width: SizeConfig.blockHorizontal * 15,
                              height: SizeConfig.blockVertical * 15,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text('ProFarma', style: TextStyle(fontSize: SizeConfig.blockVertical * 1.2),),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),

        Container(
          height: SizeConfig.blockVertical * 20,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .push(MaterialPageRoute<MenuSection>(builder: (BuildContext context) {
                return HomeProFarma();
              }));
            },
            child: Container(
              width: SizeConfig.blockHorizontal * 25,
              height: SizeConfig.blockVertical * 11,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset(
                              'assets/img/ProCare.png',
                              width: SizeConfig.blockHorizontal * 15,
                              height: SizeConfig.blockVertical * 15,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text('ProCare', style: TextStyle(fontSize: SizeConfig.blockVertical * 1.2),),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),
        
        Container(
          height: SizeConfig.blockVertical * 20,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .push(MaterialPageRoute<MenuSection>(builder: (BuildContext context) {
                return HomeProFarma();
              }));
            },
            child: Container(
              width: SizeConfig.blockHorizontal * 25,
              height: SizeConfig.blockVertical * 11,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset(
                              'assets/img/MCUPro.png',
                              width: SizeConfig.blockHorizontal * 15,
                              height: SizeConfig.blockVertical * 15,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text('MCUPro', style: TextStyle(fontSize: SizeConfig.blockVertical * 1.2),),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),

        Container(
          height: SizeConfig.blockVertical * 20,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .push(MaterialPageRoute<MenuSection>(builder: (BuildContext context) {
                return HomeProFarma();
              }));
            },
            child: Container(
              width: SizeConfig.blockHorizontal * 25,
              height: SizeConfig.blockVertical * 11,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset(
                              'assets/img/MedSupport.png',
                              width: SizeConfig.blockHorizontal * 15,
                              height: SizeConfig.blockVertical * 15,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text('MedSupport', style: TextStyle(fontSize: SizeConfig.blockVertical * 1.2),),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),
        
        Container(
          height: SizeConfig.blockVertical * 20,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .push(MaterialPageRoute<MenuSection>(builder: (BuildContext context) {
                return HomeProFarma();
              }));
            },
            child: Container(
              width: SizeConfig.blockHorizontal * 25,
              height: SizeConfig.blockVertical * 11,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset(
                              'assets/img/ProSurance.png',
                              width: SizeConfig.blockHorizontal * 15,
                              height: SizeConfig.blockVertical * 15,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text('ProSurance', style: TextStyle(fontSize: SizeConfig.blockVertical * 1.2),),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),
        
        Container(
          height: SizeConfig.blockVertical * 20,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .push(MaterialPageRoute<MenuSection>(builder: (BuildContext context) {
                return HomeProFarma();
              }));
            },
            child: Container(
              width: SizeConfig.blockHorizontal * 25,
              height: SizeConfig.blockVertical * 11,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset(
                              'assets/img/More.png',
                              width: SizeConfig.blockHorizontal * 15,
                              height: SizeConfig.blockVertical * 15,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text('More', style: TextStyle(fontSize: SizeConfig.blockVertical * 1.2),),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SliderSection extends StatefulWidget {
  @override
  _SliderSectionState createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  @override
  void initState() { 
    bloc.fetchAllTodo(); 
    super.initState();
  }
  void disopose(){
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.allTodo,
      builder: (context, AsyncSnapshot<List<TodoSlider>> snapshot) {
        final List<NetworkImage> list = <NetworkImage>[];
        if(snapshot.hasData){
          for(int i = 0; i < snapshot.data.length; i++ ) {
            list.add(NetworkImage(snapshot.data[i].imageUrl));
          }
          return Container(
            // height: SizeConfig.blockVertical * 50,
            child: SizedBox(
              child: Carousel(
                images: list,
                showIndicator: false,
                // borderRadius: false,
                moveIndicatorFromBottom: 180.0,
                noRadiusForIndicator: true,
                overlayShadow: true,
                overlayShadowColors: Colors.white,
                overlayShadowSize: 0.7,
              )
            ),
          );
        }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}

class NewsSection extends StatefulWidget {
  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  @override
  void initState() { 
    blocNews.fetchAllTodo(); 
    super.initState();
  }
  void disopose(){
    blocNews.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Flexible(
                child: StreamBuilder(
                  stream: blocNews.allTodo,
                  builder: (context, AsyncSnapshot<List<TodoNews>> snapshot) {
                    if(snapshot.hasData){
                      print(snapshot.data.length);
                      return NewsList(snapshot);
                    }else if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              )
            ]
          ),
        ),
      ),
    );
  }


  Widget NewsList(AsyncSnapshot<List<TodoNews>> snapshot){
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: Container(
            width: SizeConfig.blockHorizontal * 100,
            height: SizeConfig.blockVertical * 11,
            // padding: EdgeInsets.all(32.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
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
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Text(snapshot.data[index].judul, 
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 13, 
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Text(snapshot.data[index].isi,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 11, 
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
        );
      }
    );
  }
}
