  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';
import 'package:mocsmunchv2/pages/loginPages/loginOrRegistar.dart';
import 'package:mocsmunchv2/pages/navPages/homePage.dart';


  class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user is logged in

          if(snapshot.hasData){
            return const HomePage();
          }
          
        //user is not logged in
        else {
          return const LoginOrRegisterPage();
        }
    }
    
      )

    );
  }
} 
