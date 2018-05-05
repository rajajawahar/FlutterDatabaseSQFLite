import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflitedatabase/model/employee.dart';


class DBHelper{

  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
    "CREATE TABLE Employee(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, mobileno TEXT,emailId TEXT )");
    print("Created tables");
  }

Future<int> saveUser(Employee employee) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
    return await txn.rawInsert(
  'INSERT INTO Employee(firstname, lastname, mobileno, emailid ) VALUES('+'\''+ employee.firstName+ '\''+','+'\''+ employee.lastName+'\''+ '\''
  +employee.mobileNo+ '\''+','+ '\'' + employee.emailId + '\''+')');
});
}

}