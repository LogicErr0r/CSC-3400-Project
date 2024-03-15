// Menu class
class Menu {
  final String locationName;
  List foodTypes = [];

  Menu({
    required this.locationName,
    required this.foodTypes,
  });

  // Menu constructor for the menus json file, creates a FoodType for each item in list
  factory Menu.fromJson(String location, Map<String, dynamic> json) {
    List tempList = json[location];
    List foodTypeList = [];
    for (int i = 0; i < tempList.length; i+=2) {
      foodTypeList.add(FoodTypes.fromMenu(tempList[i], tempList[i+1]));
    }

    return Menu(
      locationName: location,
      foodTypes: foodTypeList,
    );
  }

  List<dynamic> getFoodTypes(){
    return foodTypes;
  }

  String getLocationName(){
    return locationName;
  }
}

// Food types subclass, used to hold the different types of food that a menu has
class FoodTypes {
  final String typeName;
  List food = [];

  FoodTypes({
    required this.typeName,
    required this.food,
  });

  // constructor creates Food fo each item in list
  factory FoodTypes.fromMenu(String name, List tempFood) {
    List tempList = [];
    for (int i = 0; i < tempFood.length; i+=2) {
      tempList.add(Food.fromType(tempList[i], tempList[i+1]));
    }

    return FoodTypes(
      typeName: name,
      food: tempList, 
    );
  }

  List<dynamic> getFood(){
    return food;
  }

  String getTypeName(){
    return typeName;
  }
}

// Food subclass to hold specific details about each food item
class Food {
  final String name;
  List flavors = [];
  final bool vegitarian;
  List prices = [];

  Food({
    required this.name,
    required this.flavors,
    required this.vegitarian,
    required this.prices,
  });

  // Food constructor which takes inputs from foodList and extracts details to be more easily readable
  factory Food.fromType(String tempName, List foodList) {
    bool tempBool;
    if (foodList[1] == "Y"){
      tempBool = true;
    } else {
      tempBool = false;
    }

    return Food(
      name: tempName,
      flavors: foodList[0],
      vegitarian: tempBool,
      prices: foodList[2],
    );
  }

  String getName(){
    return name;
  }
}