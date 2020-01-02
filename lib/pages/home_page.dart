import 'package:app1/pages/web_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _items = List<String>.generate(1000, (i) => "Item $i");

  _itemClick(id) {
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => WebPage()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    ListView _listView = ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int id) {
          return GestureDetector(
            onTap: () {
              _itemClick(id);
            },
            child: Container(
              padding: EdgeInsets.only(
                  left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Color.fromARGB(255, 240, 240, 240),
                width: 1,
              ))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          _items[id] + "很好" * 90,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                          strutStyle: StrutStyle(height: 1.6),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(left: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                          "https://oimagec4.ydstatic.com/image?id=-5397300958976572132&product=adpublish&w=520&h=347",
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              ),
            ),
          );
        });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("主页"),
        centerTitle: true,
      ),
      body: Container(
        child: _listView,
      ),
    );
  }
}
