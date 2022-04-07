import 'package:login_app/user_database.dart';
import 'package:login_app/user.dart';
import 'package:sqflite/sqflite.dart';

class DBOperations {
  final Database _database;

  final String columnUserEmail = "email";
  final String columnPassword = "password";

  DBOperations(this._database);

  Future<void> insertRecord(String firstName, String lastName, String password,
      String emailAddress) async {
    Map<String, Object> userMap = {
      "id": DateTime.now().millisecond,
      "first_name": firstName,
      "last_name": lastName,
      "user_password": password,
      "user_email": emailAddress,
    };

    await _database.insert(
      'users',
      userMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteRecord() async {
    await _database.delete('users');
  }

  Future<List<User>> users() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');
    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'],
          first_name: maps[i]['first_name'],
          last_name: maps[i]['last_name'],
          user_password: maps[i]['user_password'],
          user_email: maps[i]['user_email']);
    });
  }

  Future<User> getEmailAndPassword(User user) async {
    final List<Map<String, dynamic>> maps = await _database.query('users',
        columns: [columnUserEmail, columnPassword],
        where: "$columnUserEmail = ? and $columnPassword = ?",
        whereArgs: [user.user_email, user.user_password]);
    return user;
  }
}



// import 'package:login_app/user.dart';
// import 'package:sqflite/sqflite.dart';

// class DBOperations {
//   Database _db;

//   DBOperations(this._db);

//   // Future<void> insertUser(
//   //     String firstName, String username, String password) async {
//   //   Map<String, Object> userMap = {
//   //     "id": DateTime.now().millisecond,
//   //     "first_name": firstName,
//   //     "user_name": username,
//   //     "password": password,
//   //   };
//   //   // userMap.addEntries(newEntries)
//   //   await _db.insert(
//   //     'users',
//   //     userMap,
//   //     conflictAlgorithm: ConflictAlgorithm.replace,
//   //   );
//   // }

//   addPersonToDatabase(User user) async {
//     final db = await _db;
//     var insertUser = await db.insert(
//       "users",
//       user.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     return insertUser;
//   }

//   // Future<User?> getUserWithId() async {
//   //   final db = await _db;
//   //   var response = await db.query("users");
//   //   return response.isNotEmpty ? User.fromMap(response.first) : null;
//   // }

//   Future<List<User>> users() async {
//     final List<Map<String, dynamic>> maps = await _db.query('users');
//     return List.generate(maps.length, (i) {
//       return User(
//         id: maps[i]['id'],
//         firstName: maps[i]['firstName'],
//         username: maps[i]['username'],
//         password: maps[i]['password'],
//       );
//     });
//   }

// }
