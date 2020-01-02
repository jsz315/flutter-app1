import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownloadTooler{

  DownloadTooler();

  static Future<void> start(url) async{
    print("下载图片");
    print(url);
    var dio = new Dio();
    var dir = await getApplicationDocumentsDirectory();
    print("${dir.path}/1234.jpg");
    await dio.download(url, "${dir.path}/1234.jpg", onReceiveProgress: (rec, total){
      var progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
      print(progress);
    });
  }

  static void test(){
    print("downloadTest");
  }

}
