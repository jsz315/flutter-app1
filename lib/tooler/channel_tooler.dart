
import 'package:app1/core.dart';
import 'package:app1/tooler/string_tooler.dart';
import 'package:flutter/services.dart';

class ChannelTooler{

  MethodChannel _methodChannel = const MethodChannel('jsz_plugin_method');
  EventChannel _eventChannel = EventChannel('jsz_plugin_event');

  ChannelTooler();

  void init(){
    _eventChannel.receiveBroadcastStream().listen(_onEnvent, onError: _onError);
  }

  void _onEnvent(Object obj){
    print(obj);
    var list = StringTooler.getData(obj);
    if(list.length == 2){
      Core.instance.sqlTooler.add(list[0], list[1]);
    }
    // Core.instance.sqlTooler.add(obj);
  }

  void _onError(Object obj){

  }

  void run(runing){
    Future<String> future = _methodChannel.invokeMethod("run", runing);
    future.then((message) {
      print(message);
    });
  }
}
  