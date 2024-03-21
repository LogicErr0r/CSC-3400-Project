import 'package:flutter/material.dart';

class ManageAccountPage extends StatelessWidget {
  const ManageAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Account',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: const Color.fromRGBO(237, 38, 71, 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Account Info
            const Text(
              'Account Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                'Email',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'example@example.com',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: const Icon(Icons.edit, color: Colors.white),
              onTap: () {
                // Handle email edit
              },
            ),
            ListTile(
              title: const Text(
                'Password',
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(Icons.edit, color: Colors.white),
              onTap: () {
                // Handle password change
              },
            ),
            const SizedBox(height: 30),

            // Account Actions
            const Text(
              'Account Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                'Change Username',
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(Icons.edit, color: Colors.white),
              onTap: () {
                // Handle username change
              },
            ),
            ListTile(
              title: const Text(
                'Delete Account',
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(Icons.delete, color: Colors.red),
              onTap: () {
                // Handle account deletion
              },
            ),
          ],
        ),
      ),
    );
  }
}
