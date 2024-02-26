import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  // Controller for the search bar
  final TextEditingController _filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: const Color.fromRGBO(237, 38, 71, 1.0), // Change background color to pink
        child: Column(
          children: <Widget>[
            // Search bar
            TextField(
              controller: _filter,
              style: const TextStyle(color: Colors.white), // Change search bar text color to white
              decoration: const InputDecoration(
                labelText: 'Search For Friends',
                labelStyle: TextStyle(color: Colors.white), // Change search bar label color to white
                prefixIcon: Icon(Icons.search, color: Colors.white), // Change search icon color to white
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.white), // Change search bar border color to white
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'You currently have no friends',
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size as you see fit
                    color: Colors.white, // Adjust the color as needed
                    // Add more TextStyle properties according to your design
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
