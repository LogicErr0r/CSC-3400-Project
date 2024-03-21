import 'package:flutter/material.dart';
import 'package:mocsmunchv2/pages/miscPages/settingsPages/getApp.dart';
import 'package:mocsmunchv2/pages/miscPages/settingsPages/manageAccountPage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, Key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white), // Make the text white
        ),
        centerTitle: true, // Center align the title
        backgroundColor: Colors.black, // Change the color
        iconTheme: const IconThemeData(color: Colors.white), // Change the color of the navigation arrow
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: const Color.fromRGBO(237, 38, 71, 1.0), // Change the background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // User Profile Picture
            const CircleAvatar(
              radius: 90,
              //backgroundImage: AssetImage('assets/profile_picture.jpg'), // Provide your image path here
            ),
            const SizedBox(height: 20),

            //Greeting
            const Text(
              'what\'s up', // Your generic name here
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 217, 216, 216),
              ),
            ),

            // User's Name
            const Text(
              'CURRENT_USER', // Your generic name here
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            // Settings 1 - Push Notifications
            ListTile(
              title:
                const Text(
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
                const Text(
                  'Manage Account', // Your generic name here
                  style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios), // Add an icon for navigation if needed
              onTap: () {
                // Navigate to ManageAccountPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManageAccountPage()),
                );

              },
            ),
            
            // Settings 3 - Change Student/Delivery Mode
            ListTile(
              title:
                const Text(
                  'Change Student/Delivery Mode', // Your generic name here
                  style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios), // Add an icon for navigation if needed
              onTap: () {
                // Handle navigation to mode change page
              },
            ),

            // Settings 4 - About the developers
            ListTile(
              title:
                const Text(
                  'Manage your GET app', // Your generic name here
                  style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios), // Add an icon for navigation if needed
              onTap: () {
                // Navigate to ManageAccountPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetAppPage()),
                );
              },
            ),

            // Settings 5 - About the developers
            ListTile(
              title:
                const Text(
                  'Bar Code for Mobile Purchase', // Your generic name here
                  style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios), // Add an icon for navigation if needed
              onTap: () {
                // Handle navigation to about page
              },
            ),
            
            // Settings 6 - Delete Account
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black, // Text color
              ),
              onPressed: () {
                // Handle account deletion
              },
              child: const Text(
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
