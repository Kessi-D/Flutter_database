import 'package:flutter/material.dart';
import 'package:login_app/user_database.dart';
import 'package:login_app/db_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String firstName = "";
  String lastName = "";
  String emailAddress = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 180, 156, 156),
        body: Container(
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create an account \nin one click",
                style: TextStyle(
                    color: Color.fromARGB(255, 77, 206, 223),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 48,
              ),
              _firstName(),
              const SizedBox(
                height: 16,
              ),
              _lastName(),
              const SizedBox(
                height: 16,
              ),
              _email(),
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
                        DBOperations(db).insertRecord(
                            firstName, lastName, password, emailAddress);
                      }),
                      style: ElevatedButton.styleFrom(elevation: 0),
                      child: Text("Register"))),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a user? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 77, 206, 223)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  TextFormField _firstName() {
    return TextFormField(
        onChanged: ((newValue) {
          firstName = newValue;
        }),
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
            hintText: "first name",
            hintStyle: TextStyle(
              color: Colors.grey,
            )));
  }

  TextFormField _lastName() {
    return TextFormField(
        onChanged: ((newValue) {
          lastName = newValue;
        }),
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
            hintText: "last name",
            hintStyle: TextStyle(
              color: Colors.grey,
            )));
  }

  TextFormField _email() {
    return TextFormField(
        onChanged: ((newValue) {
          emailAddress = newValue;
        }),
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
            hintText: "email address",
            hintStyle: TextStyle(
              color: Colors.grey,
            )));
  }

  TextFormField _passwordfield() {
    return TextFormField(
        onChanged: ((newValue) {
          password = newValue;
        }),
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
