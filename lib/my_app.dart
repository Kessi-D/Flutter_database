import 'package:flutter/material.dart';
import 'package:login_app/homepage.dart';
import 'package:login_app/login_page.dart';
import 'package:login_app/register.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/login": (context) => LoginPage(title: "Login Page"),
        "/register": (context) => RegisterPage(title: "Register Page"),
        "/homepage": (context) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: ''),
    );
  }
}
