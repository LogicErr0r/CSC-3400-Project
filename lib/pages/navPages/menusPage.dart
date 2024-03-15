import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'menus.dart';

class RestaurantMenuPage extends StatefulWidget {
  const RestaurantMenuPage({Key? key}) : super(key: key);

  @override
  State<RestaurantMenuPage> createState() => _RestaurantMenuPageState();
}

class _RestaurantMenuPageState extends State<RestaurantMenuPage> {
  List _locations = [];
  final Map<String, dynamic> _menus = {};
  
  Future<dynamic> readJson() async {
    final String response = await rootBundle.loadString('assets/menus.json');
    final data = await json.decode(response);
    setState(() {
      _locations = data['locations'];
      for (String x in _locations){
        _menus[x] = (Menu.fromJson(x, data));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // call the json file
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    automaticallyImplyLeading: false, // This will remove the back arrow
    title: Text(
      "            Account Balance: 0.00 Snake Bites",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18, // Set text color to white
      ),
    ),
    backgroundColor: Colors.black, // Set background color to black
  ),
    body: Container(
      color: Color.fromRGBO(237, 38, 71, 1.0), // Set background color to pink
      child: ListView.builder(
        itemCount: _locations.length,
        itemBuilder: (context, index) {
          String location = _locations[index];
          return Column(
            children: [
              ExpansionTile(
                title: Text(
                  location,
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                  ),
                ),
                children: _buildMenuList(_menus[location].getFoodTypes() ?? {}),
              ),
              SizedBox(height: 40), // Add space between ExpansionTiles
            ],
          );
        },
      ),
    ),
  );
}

  List<Widget> _buildMenuList(List<FoodTypes> types) {
    List<Widget> menuItems = [];
    for (FoodTypes x in types) {
    menuItems.add(
      Container(
        color: Colors.black, // Set background color to black
        child: ListTile(
          title: Text(
            x.getTypeName(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
      ),
    );
      for (Food y in x.getFood()) {
        menuItems.add(
          ListTile(
            title: Text(y.getName(),
            style: TextStyle(color: Colors.white),),
          ),
        );
      }
    }
    return menuItems;
  }
}
