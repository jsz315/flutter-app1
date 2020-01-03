import './pages/about_page.dart';
import './pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import './pages/home_page.dart';
import './tooler/download_tooler.dart';

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

    // DownloadTooler.init();

    var permission =  PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print("permission status is " + permission.toString());
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage, // 在这里添加需要的权限
    ]);
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SafeArea(
        child: TabBarView(
          controller: _controller,
          children: <Widget>[
            new HomePage(),
            new DetailPage(),
            new AboutPage(),
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