
import 'package:app1/tooler/toast_tooler.dart';

import '../core.dart';
import './string_tooler.dart';
import 'package:flutter/services.dart';

class ChannelTooler{

  MethodChannel _methodChannel = const MethodChannel('jsz_plugin_method');
  EventChannel _eventChannel = EventChannel('jsz_plugin_event');

  List<SystemListener> _listeners = [];

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
    _listeners.forEach((listener){
      listener.onReceive(obj);
    });
  }

  void _onError(Object obj){

  }

  void listen(SystemListener systemListener){
    _listeners.add(systemListener);
  }

  Future<String> info() async{
    var res = await _methodChannel.invokeMethod("info");
    return res;
  }

  void run(runing){
    Future<String> future = _methodChannel.invokeMethod("run", runing);
    future.then((message) {
      print(message);
    });
  }
}

class SystemListener{
  onReceive(obj){}
}
  