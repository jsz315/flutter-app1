// Get a location using getDatabasesPath
import 'package:sqflite/sqflite.dart';


class SqlTooler{
  
  String databaseName = "movie";
  String tableName = "girl";
  // Database database;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDatabase();
 
    return _db;
  }

  _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + '/$databaseName.db'; 
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async{
    await db.execute(
      'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, word TEXT, link TEXT, title TEXT, image TEXT, video TEXT)'
    );
    print("数据库创建成功");
  }


  Future<void> init() async{
    // var databasesPath = await getDatabasesPath();
    // String path = databasesPath + '/$databaseName.db';
    // print(path);

    // // Delete the database
    // await deleteDatabase(path);

    // // open the database
    // database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
    //   // When creating the db, create the table
    //   await db.execute(
    //     'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, word TEXT, link TEXT, title TEXT, image TEXT, video TEXT)'
    //   );
    // });

    // print("数据库创建成功");

    // Insert some records in a transaction
    // await database.transaction((txn) async {
    //   int id1 = await txn.rawInsert(
    //     'INSERT INTO $tableName(word) VALUES("驾培🏅戴教练发了一个快手作品，一起来看！ http://kphshanghai.m.chenzhongtech.com/s/xNbMeYmE 复制此链接，打开【快手】直接观看！")'
    //   );
    //   print('inserted1: $id1');
    // });

    // Update some record
    /*
    int count = await database.rawUpdate(
        'UPDATE $tableName SET link = ?, title = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');
    */

    // Get the records
    // List<Map> list = await database.rawQuery('SELECT * FROM $tableName');
    // List<Map> expectedList = [
    //   {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
    //   {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    // ];
    // print(list);
    // print(expectedList);

    // Count the records
    /*
    count = Sqflite
        .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM $tableName'));
    assert(count == 2);

    // Delete a record
    count = await database
        .rawDelete('DELETE FROM $tableName WHERE name = ?', ['another name']);
    assert(count == 1);
    */

    // Close the database
    // await database.close();
  }

  Future<void> update(id, title) async {
    var database = await db;
     int count = await database.rawUpdate(
        'UPDATE $tableName SET title = ? WHERE id = ?',
        [title, id]
      );
    print('updated: $count');
  }

  Future<void> updateTitle(id, title) async {
    var database = await db;
     int count = await database.rawUpdate(
        'UPDATE $tableName SET title = ? WHERE id = ?',
        [title, id]
      );
    print('updated: $count');
  }

  Future<void> updateImage(id, image) async {
    var database = await db;
     int count = await database.rawUpdate(
        'UPDATE $tableName SET image = ? WHERE id = ?',
        [image, id]
      );
    print('updated: $count');
  }

  Future<void> updateVideo(id, video) async {
    var database = await db;
     int count = await database.rawUpdate(
        'UPDATE $tableName SET video = ? WHERE id = ?',
        [video, id]
      );
    print('updated: $count');
  }

  Future<void> test() async {
    // var res;
    // await add("驾培🏅戴教练发了一个快手作品，一起来看！ http://kphshanghai.m.chenzhongtech.com/s/xNbMeYmE 复制此链接，打开【快手】直接观看！");
    // await add("驾培🏅戴教练");
    // await add("戴教练");
    // await updateTitle(2, "哈哈");
    // await delete(1);
    // res = await movies();
    // print(res);
  }
  

  Future<void> add(word, link) async{
    var database = await db;
    await database.transaction((txn) async {
      // var sql = 'INSERT INTO $tableName(word) VALUES("驾培🏅戴教练发了一个快手作品，一起来看！ http://kphshanghai.m.chenzhongtech.com/s/xNbMeYmE 复制此链接，打开【快手】直接观看！")';
      var sql = 'INSERT INTO $tableName(word, link) VALUES("$word", "$link")';
      int id = await txn.rawInsert(sql);
      print('inserted: $id');
    });
  }

  Future<void> delete(id) async{
    var database = await db;
    var count = await database.rawDelete('DELETE FROM $tableName WHERE id = ?', [id]);
    print('count: $count');
  }

  Future<List<Map>> movies() async{
    var database = await db;
    List<Map> list = await database.rawQuery('SELECT * FROM $tableName');
    print(list);
    return list;
  }

}