import '../core.dart';
import '../tooler/string_tooler.dart';
import '../tooler/toast_tooler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../movie_model.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool _runing;

  void initState(){
    super.initState();
    _runing = false;
  }

  void _changeRuning(c){
    setState(() {
      _runing = c;
    });
    ToastTooler.toast(context, msg: "check", position: ToastPostion.bottom);
  }

  void _addWord() async{
    // await Core.instance.sqlTooler.add("驾培🏅戴教练发了一个快手作品，一起来看！ http://kphshanghai.m.chenzhongtech.com/s/xNbMeYmE 复制此链接，打开【快手】直接观看！");
    
    // RegExp reg = new RegExp(r"一起来看！ (http\S+) 复制此链接");
    String data = "姗姗💗＠¥发了一个快手作品，一起来看！ http://kphshanghai.m.chenzhongtech.com/s/9ctVsLxo 复制此链接，打开【快手】直接观看！";
    var list = StringTooler.getData(data);
    if(list.length == 2){
      await Core.instance.sqlTooler.add(list[0], list[1]);
      _update();
    }
    
  }

  void _update() async{
    List<Map> movies = await Core.instance.sqlTooler.movies();
    var movieModel = Provider.of<MovieModel>(context);
    movieModel.update(movies);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Text("开启服务"),
            ),
            Switch(
              value: _runing,
              onChanged: _changeRuning,
            ),
          ],),
          MaterialButton(
            child: new Text('添加数据'),
            onPressed: (){_addWord();},
          ),
          MaterialButton(
            child: new Text('刷新数据'),
            onPressed: (){_update();},
          )
        ],
      ) 
    );
  }
}