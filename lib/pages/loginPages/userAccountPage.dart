import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocsmunchv2/pages/navPages/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class UserAccountPage extends StatefulWidget {
  const UserAccountPage({Key? key});

  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  final TextEditingController _usernameController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String _userType = 'student'; // Default user type

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } 
      else {
        print('No image selected.');
      }
    });
  }

  void homePage() { //go to hme page logic
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
  }

  
  Future<void> saveUsername() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username': _usernameController.text,
      }, SetOptions(merge: true)); // Merge the existing feilds

      homePage(); // Navigate to HomePage after saving the username
    } else {
    
      print('No user is currently logged in.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Creation',
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color.fromRGBO(237, 38, 71, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'What do we call you?',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _usernameController,
              style: TextStyle(color: Colors.black), 
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, 
                hintText: 'Enter username here',
                hintStyle: TextStyle(color: Colors.black54), 
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 50),
            Text(
              "What's your swag like?",
              style: TextStyle(
                color: Colors.white, 
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            if (_image != null)
              CircleAvatar(
                backgroundImage: FileImage(_image!),
                radius: 60,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Profile Image'),
            ),
            SizedBox(height: 50),
            Text(
              'What squad are you repping?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            ListTile(
              title: Text(
                'Student',
                style: TextStyle(color: _userType == 'student' ? Colors.white : Colors.black), // Text color is white when selected, black when not
              ),
              leading: Radio<String>(
                value: 'student',
                groupValue: _userType,
                onChanged: (String? value) {
                  setState(() {
                    _userType = value!;
                  });
                },
                activeColor: Colors.white, // Selected circle color is white
              ),
            ),
            ListTile(
              title: Text(
                'Delivery',
                style: TextStyle(color: _userType == 'delivery' ? Colors.white : Colors.black), // Text color is white when selected, black when not
              ),
              leading: Radio<String>(
                value: 'delivery',
                groupValue: _userType,
                onChanged: (String? value) {
                  setState(() {
                    _userType = value!;
                  });
                },
                activeColor: Colors.white, // Selected circle color is white
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                saveUsername(); // Save the username and then navigate to the HomePage
              },
              child: const Text('Take me to the food'),
            ),
          ],
        ),
      ),
    );
  }
}