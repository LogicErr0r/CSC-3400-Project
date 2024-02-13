import 'package:flutter/material.dart';
import 'package:mocsmunchv2/login.dart';
import 'login.dart';
import 'HomePage.dart';
import 'RegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();

}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );

    } else {
      return RegisterPage(onTap: togglePages,);
    }
  }
}