import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocsmunchv2/pages/loginPages/authPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  }

  // Method to navigate to settings page
  void goToSettingsPage() {
    // Navigate to settings page
  }

  // Variables to keep track of the current page index
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    // Define your pages here

    //Map Page
    Text('Interactive Map here'),
    //MapPage(),

    //Friends Page
    Text('Friends List and Chat here'),
    //FriendsPage(),

    //Food Page
    Text('All Food Menu Tabs here'),
    //MenusPage(),
  ];

  // Method to handle bottom navigation bar item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    /*// If Menu Page is tapped, navigate to MenusPage
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapPage()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FriendsPage()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenusPage()),
      );
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 38, 71, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.black,

        //Settings Page Hoopla
        leading: IconButton(
          onPressed: goToSettingsPage,
          icon: const Icon(Icons.settings),
        ),

        //Sign User Out
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Set background color to black
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
            icon: Icon(Icons.people),
            label: "Friends",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_food),
            label: "Food",
          ),
        ],
      ),
    );
  }
}
