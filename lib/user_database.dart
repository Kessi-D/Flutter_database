import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> initDb() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'app_database.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
            'CREATE TABLE users(id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT, user_password TEXT, user_email TEXT)');
      },
      version: 1,
    );

    // Open the database and store the reference.
    return database;
  }
}
