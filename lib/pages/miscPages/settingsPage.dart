import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white), // Make the text white
        ),
        centerTitle: true, // Center align the title
        backgroundColor: Colors.black, // Change the color
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Color.fromRGBO(237, 38, 71, 1.0), // Change the background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // User Profile Picture
            CircleAvatar(
              radius: 90,
              //backgroundImage: AssetImage('assets/profile_picture.jpg'), // Provide your image path here
            ),
            SizedBox(height: 30),

            // User's Name
            Text(
              'FirstName LastName', // Your generic name here
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),

            // Settings 1 - Push Notifications
            ListTile(
              title:
                Text(
                  'Enable Push Notifications', // Your generic name here
                  style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Switch(
                value: true, // Change this value based on user settings
                onChanged: (bool value) {
                  setState(() {
                    // Update the state based on user interaction
                  });
                },
              ),
            ),

            // Settings 2 - Manage Account
            ListTile(
              title:
                Text(
                  'Manage Account', // Your generic name here
                  style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios), // Add an icon for navigation if needed
              onTap: () {
                // Handle navigation to account management page
              },
            ),
            
            // Settings 3 - Change Student/Delivery Mode
            ListTile(
              title:
                Text(
                  'Change Student/Delivery Mode', // Your generic name here
                  style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios), // Add an icon for navigation if needed
              onTap: () {
                // Handle navigation to mode change page
              },
            ),

            // Settings 4 - About the developers
            ListTile(
              title:
                Text(
                  'About the Developers', // Your generic name here
                  style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios), // Add an icon for navigation if needed
              onTap: () {
                // Handle navigation to about page
              },
            ),
            
            // Settings 5 - Delete Account
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Background color
                onPrimary: Colors.white, // Text color
              ),
              onPressed: () {
                // Handle account deletion
              },
              child: Text(
                'Delete Account',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
