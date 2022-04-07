import 'package:flutter/material.dart';
import 'package:login_app/user_database.dart';
import 'package:login_app/db_helper.dart';
import 'package:login_app/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    testDB();
    super.initState();
  }

  void testDB() async {
    var db = await AppDatabase().initDb();
    DBOperations(db).users().then((value) => {
          print("USERS " + value[0].user_email),
          print("USERS " + value[0].user_password)
        });
  }

  String firstName = "";
  String columnUserEmail = "";
  String columnPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf7f7f7),
        body: Container(
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome back, $firstName",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Login to your account",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 48,
              ),
              _inputfield(),
              const SizedBox(
                height: 16,
              ),
              _passwordfield(),
              const SizedBox(
                height: 24,
              ),
              Container(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: (() async {
                        var db = await AppDatabase().initDb();
                        DBOperations(db).users().then((value) => {
                              print(columnUserEmail),
                              print(columnPassword),
                              if (value[0].user_email == columnUserEmail &&
                                  value[0].user_password == columnPassword)
                                {Navigator.pushNamed(context, "/homepage")}
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Data not correct")))
                                }
                            });
                        // Navigator.pushNamed(context, "/Login");
                      }),
                      style: ElevatedButton.styleFrom(elevation: 0),
                      child: Text("LOGIN"))),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New here? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: const Text(
                        "Create an account",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.blue),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  TextFormField _inputfield() {
    return TextFormField(
        onChanged: (newValue) {
          columnUserEmail = newValue;
        },
        decoration: const InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            errorBorder: 1 == 2
                ? OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                : OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
            focusedErrorBorder: 1 == 1
                ? OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                : OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            errorText: 1 == 2 ? "error text is here" : null,
            errorStyle: TextStyle(
              color: Colors.red,
            ),
            hintText: "username",
            hintStyle: TextStyle(
              color: Colors.grey,
            )));
  }

  TextFormField _passwordfield() {
    return TextFormField(
        onChanged: (newValue) {
          columnPassword = newValue;
        },
        obscureText: true,
        decoration: const InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            errorBorder: 1 == 2
                ? OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                : OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
            focusedErrorBorder: 1 == 2
                ? OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                : OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            errorText: 1 == 2 ? "error text is here" : null,
            errorStyle: TextStyle(
              color: Colors.red,
            ),
            hintText: "password",
            hintStyle: TextStyle(
              color: Colors.grey,
            )));
  }
}
