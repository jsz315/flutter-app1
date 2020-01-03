import '../movie_model.dart';
import 'package:provider/provider.dart';

import './web_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _itemClick(id) {
    var movieModel = Provider.of<MovieModel>(context);
    movieModel.changeTitle();
    movieModel.choose(id);
    var movie = movieModel.movies[movieModel.index];
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => WebPage(
            movie: movie
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    var movieModel = Provider.of<MovieModel>(context);
    var movies = movieModel.movies;
    print("=====");
    print(movies);

    ListView _listView = ListView.builder(
        itemCount: movies.length,
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
                          movies[id]["word"],
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
        // title: Text(Provider.of<String>(context)),
        // title: Consumer<String>(builder: (context, data, child){
        //   return Text(data + " -1");
        // }),
        title: Consumer<MovieModel>(builder: (context, data, child){
          return Text(data.title);
        }),
        centerTitle: true,
      ),
      body: Container(
        child: _listView,
      ),
    );
  }
}
