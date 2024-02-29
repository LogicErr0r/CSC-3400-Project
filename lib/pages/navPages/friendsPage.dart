import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  // Controller for the search bar
  final TextEditingController _filter = TextEditingController();

  bool _showNearbyMunchers = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: const Color.fromRGBO(237, 38, 71, 1.0), // Background color
        child: Column(
          children: <Widget>[
            TextField(
              controller: _filter,
              style: const TextStyle(color: Colors.white), // Text color
              decoration: const InputDecoration(
                labelText: 'Search For Friends to Add',
                labelStyle: TextStyle(color: Colors.white), // Label color
                prefixIcon: Icon(Icons.search, color: Colors.white), // Icon color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.white), // Border color
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _showNearbyMunchers = value.isEmpty;
                });
              },
            ),
            SizedBox(height: 40),

            if (_showNearbyMunchers)
              Container(
                child: ListTile(
                  title: Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        '             You have no friends... yet', // Add the text you want to display
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: 40),

            if (_showNearbyMunchers)
              Container(
                color: Colors.black, // Set background color to black
                child: ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Available Munchers', // Add the text you want to display
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: (_filter.text.isEmpty)
                    ? FirebaseFirestore.instance.collection('users').snapshots()
                    : FirebaseFirestore.instance
                        .collection('users')
                        .where('username', isEqualTo: _filter.text)
                        .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                  var docs = snapshot.data!.docs;
                  if (docs.isEmpty && !_showNearbyMunchers) {
                    return Center(
                      child: Text(
                        'No matching friends found',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(docs[index]['username'], style: TextStyle(color: Colors.white)),
                        // Add other UI elements or functionality as needed
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
