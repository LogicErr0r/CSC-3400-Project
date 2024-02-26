import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocsmunchv2/pages/loginPages/authPage.dart';
import 'package:mocsmunchv2/pages/navPages/friendsPage.dart';
import 'package:mocsmunchv2/pages/miscPages/settingsPage.dart';
import 'package:mocsmunchv2/pages/navPages/menusPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  }

  void goToSettingsPage() {
    // Navigate to settings page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  int _selectedIndex = 0;

  // Removed 'static const' from _pages list
  final List<Widget> _pages = [
    const Text('Interactive Map here'), // Example Page
    const RestaurantMenuPage(), // Menu Page
    const FriendsPage(), //Friends Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 38, 71, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: goToSettingsPage,
          icon: const Icon(Icons.settings),
          color: Colors.white
        ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
            color: Colors.white
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_food),
            label: "Food",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Friends",
          ),
        ],
      ),
    );
  }
}
