import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:app1/tooler/download_tooler.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  WebViewController _webViewController;
  String _title = "";

  _callJavascript(){
    // var js = 'document.querySelector("#logo").style.backgroundColor="#440099";';
    var js = [
      'var video = document.querySelector("video");',
      'var src = video.getAttribute("src");',
      'var poster = video.getAttribute("poster");',
      // 'JSON.stringify({src:1, poster:2})'
      'src + "," + poster'
    ].join("");
    _webViewController.evaluateJavascript(js).then((res){
      print(res);
      String str1 = res.toString();
      var aim = str1.replaceAll(new RegExp(r'"'), "");
      print(aim);

      var list = aim.split(",");
      print(list);
      print(list[0]);
      
      // start(list[1]);
      DownloadTooler.start(list[1]);

      var obj = {
        "a":1,
        "b":4
      };
      print(obj["a"]);
      print(obj["b"]);

      // Map<String, dynamic> user = JSON.decode(json);

      var str = "{\"src\":1,\"poster\":2}";
      print(str.length);
      print(res.length);

      dynamic fk = json.decode(str);
      // Map<String, dynamic> fk = new Map<String, dynamic>.from(json.decode(res));
      print(fk);
      print(fk.toString());
      print(fk["src"]);
      

      // Map map = json.decode(res);
      // var movie = new Movie.fromJson(map);
      // print(movie.src);
      // print(movie.poster);

      // String result = "{\"status\": 0, \"description\": \"success\", \"data\": {\"token\": \"eyJhbGciOiJIUzI1NiJ9.eyJtZW1pZCI6IjEzOTgxOTgzNTMyIiwiY29tcGFueV9pZCI6MjAxNzExMjQzLCJleHAiOjE1NDUyODA5MjB9.3RnJR1i70jD1TUpDn52UTgOrqhhXRZpvS9yMMTD4G74\"}, \"extra\": {\"ssize\": 1, \"snow\": 1542688920, \"other\": null}}";//response.data.toString();
      // print(result);
      // Map<String, dynamic> resultMap = json.decode(result);
      // print(resultMap['description']);
      // print(resultMap['status']);
      
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: WebView(
        initialUrl: "http://kphshanghai.m.chenzhongtech.com/s/xNbMeYmE",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          _webViewController = webViewController;
        },
        onPageFinished: (url){
          _webViewController.evaluateJavascript("document.title").then((res){
            setState(() {
              _title = res;
            });
          });
        },
        navigationDelegate: (NavigationRequest navigationRequest){
          // if(navigationRequest.url.startsWith("http://")){
          //   return NavigationDecision.prevent;
          // }
          print(navigationRequest.url);
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _callJavascript();
        },
      ),
    );
  }
}

class Movie {
  final String src;
  final String poster;

  Movie(this.src, this.poster);

  Movie.fromJson(Map<dynamic, dynamic> json)
      : src = json['src'],
        poster = json['poster'];

  Map<dynamic, dynamic> toJson() =>
    {
      'src': src,
      'poster': poster,
    };
}

// start(fileUrl) async{
//   var dio = new Dio();
//   var fileDir = await getApplicationDocumentsDirectory();
//   await dio.download(fileUrl, "${fileDir.path}/1234.jpg", onReceiveProgress: (received, total) {
//     if (total != -1) {
//       print("Rec: $received , Total: $total");
//       print(((received / total) * 100).toStringAsFixed(0) + "%");
//     }
//   });
// }