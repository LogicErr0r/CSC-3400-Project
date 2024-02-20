import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  // Controller for the search bar
  final TextEditingController _filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends Page'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            // Search bar
            TextField(
              controller: _filter,
              decoration: InputDecoration(
                labelText: 'Search For Friends',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'You currently have no friends',
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size as you see fit
                    color: Colors.black, // Adjust the color as needed
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
