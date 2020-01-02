import 'package:app1/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
      vsync: ScrollableState(),
      length: 3
    );
    _controller.addListener((){
      print(_controller.index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SafeArea(
        child: TabBarView(
          controller: _controller,
          children: <Widget>[
            new HomePage(),
            Text("page2"),
            Text("page3"),
          ],
        ),
      ) ,
      bottomNavigationBar: Material(
        color: Colors.black,
        child: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(text: "home", icon: Icon(Icons.home),),
            Tab(text: "detail", icon: Icon(Icons.home),),
            Tab(text: "about", icon: Icon(Icons.home),),
          ],
        ),
      ),
      
    );
  }
}