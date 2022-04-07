import 'package:flutter/material.dart';
import 'package:login_app/user_database.dart';
import 'package:login_app/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Homepage is here"),
            ElevatedButton(
                onPressed: () async {
                  var db = await AppDatabase().initDb();
                  DBOperations(db).deleteRecord();
                  Navigator.defaultRouteName;
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
