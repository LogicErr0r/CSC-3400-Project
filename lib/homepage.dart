import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mocsmunchv2/LoginOrRegistar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    const LoginOrRegisterPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Sign out Button
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),

      //Center and Nav Bar
      body: Container(
        child: const Center(child: Text("Chat")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: ("Map"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: ("Friends"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_food),
            label: ("Food"),
          ),
        ],
      ),
    );
  }
}