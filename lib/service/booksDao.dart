import 'dart:async';

import 'package:booky/models/book.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//class booksDoa {

//abstract class DB {
//  static Database _db;
//
//  static Future<void> init() async {
//    print("init called");
//  if (_db != null) { return; }
//  try {
//  String _path = await getDatabasesPath() + 'example';
//  _db = await openDatabase(
//    // Set the path to the database.
//    _path,
//// When the database is first created, create a table to store dogs.
//    onCreate: (db, version) {
//      print("creating db here");
//// Run the CREATE TABLE statemen}t on the database.
//      return db.execute(
//        "CREATE TABLE books(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isbn TEXT)",
//      );
//    },
//// Set the version. This executes the onCreate function and provides a
//// path to perform database upgrades and downgrades.
//    version: 1,
//  );
//  }
//  catch(ex) {
//  print(ex);
//  }
//}

//}

  final Future<Database> database = openDatabase(
  join(getDatabasesPath().toString(), 'books_database.db'),
  onCreate: (db, version) {
  print("creating db here");
  return db.execute(
  "CREATE TABLE books(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isbn TEXT)",
  );
  },
  version: 1);


  Future<String> insertBook(Book book) async {
    try {
    final Database db = await database;
    await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return "Succesfully Saved";
  }
  catch(ex){
      print(ex);
      return 'failed';
  }
  }

  Future  <List<Book>>getBooks() async {
    print('my method is called');
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('books');
print(maps);
    // Convert the List<Map<String, dynamic> into a List<Dog>.

    return List.generate(maps.length, (i) {
      return (
        Book(
        name: maps[i]['name'],
        isbn: maps[i]['isbn'],
      )
      );
    });
  }


//}