// Menu class
class Menu {
  final String locationName;
  List<FoodTypes> foodTypes = []; // Adjusted type here

  Menu({
    required this.locationName,
    required this.foodTypes,
  });

  // Menu constructor for the menus json file, creates a FoodType for each item in list
  factory Menu.fromJson(String location, Map<String, dynamic> json) {
    List tempList = json[location];
    List<FoodTypes> foodTypeList = []; // Adjusted type here
    for (int i = 0; i < tempList.length; i += 2) {
      if (i + 1 < tempList.length) {
        foodTypeList.add(FoodTypes.fromMenu(tempList[i], tempList[i + 1]));
      } else {
        // Handle the case where the list doesn't have enough elements
        // You might want to log an error or handle this case according to your application's logic
      }
    }

    return Menu(
      locationName: location,
      foodTypes: foodTypeList,
    );
  }

  List<FoodTypes> getFoodTypes() { // Adjusted return type here
    return foodTypes;
  }

  String getLocationName() {
    return locationName;
  }
}

// Food types subclass, used to hold the different types of food that a menu has
class FoodTypes {
  final String typeName;
  List<Food> food = []; // Adjusted type here

  FoodTypes({
    required this.typeName,
    required this.food,
  });

  // constructor creates Food for each item in list
  factory FoodTypes.fromMenu(String name, List tempFood) {
    List<Food> tempList = []; // Adjusted type here
    for (int i = 0; i < tempFood.length; i += 2) {
      if (i + 1 < tempFood.length) {
        tempList.add(Food.fromType(tempFood[i], tempFood[i + 1]));
      } else {
        // Handle the case where the list doesn't have enough elements
        // You might want to log an error or handle this case according to your application's logic
      }
    }

    return FoodTypes(
      typeName: name,
      food: tempList,
    );
  }

  List<Food> getFood() { // Adjusted return type here
    return food;
  }

  String getTypeName() {
    return typeName;
  }
}

// Food subclass to hold specific details about each food item
class Food {
  final String name;
  List flavors = [];
  final bool vegetarian;
  List prices = [];

  Food({
    required this.name,
    required this.flavors,
    required this.vegetarian,
    required this.prices,
  });

  // Food constructor which takes inputs from foodList and extracts details to be more easily readable
  factory Food.fromType(String tempName, List foodList) {
    bool tempBool = foodList[1] == "Y";

    return Food(
      name: tempName,
      flavors: foodList[0],
      vegetarian: tempBool,
      prices: foodList[2],
    );
  }

  String getName() {
    return name;
  }
}
