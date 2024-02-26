import 'package:flutter/material.dart';

class RestaurantMenuPage extends StatefulWidget {
  const RestaurantMenuPage({Key? key}) : super(key: key);

  @override
  State<RestaurantMenuPage> createState() => _RestaurantMenuPageState();
}

class _RestaurantMenuPageState extends State<RestaurantMenuPage> {
  List<String> _locations = [
    "Buckstop",
    "Grillmaster",
    "Healthy Blend Deli",
    "Steak 'n Shake",
    "The Happy Place BBQ",
    "TuTu's Cyber Cafe",
    "Wynee's Bistro",
  ];

  Map<String, Map<String, List<String>>> _menus = {
    "The Happy Place BBQ": {
      "Breakfast": [
        "Danish - \$2.50",
        "Muffin - \$2.50",
        "Hash Brown - \$1.00",
        "Corn Muffin - \$1.00",
        "Breakfast Quesadilla - \$4.75",
        "Fruit Cup - \$1.95",
        "Assorted Cereal Bars - \$1.50",
        "Happy Wrap (Bacon Egg and Cheese) - \$4.75",
      ],
      "Beverages": [
        "Coffee - \$1.50",
        "Tea - \$1.50",
        "Orange Juice - \$2.29",
      ],
      "Sandwich or Salad Meals": [
        "Pulled Smoked Pork - \$5.95",
        "Pulled Smoked Chicken - \$5.95",
        "Smoked Beef Brisket - \$5.95",
        "Smoked Portabella - \$5.95",
        "Cheese Quesadilla - \$2.75",
        "Meat Quesadilla (Pulled Pork, Pulled Chicken, Pulled Brisket, Portabella) - \$4.75",
        "Salad Meal - \$5.95",
        "Daily Special Meal - \$5.95",
        "Daily Special Sandwich - \$4.25",
        "Sandwich Only - \$4.25",
        "Loaded Fries - \$4.50",
      ],
      "Sides and More": [
        "Baked Beans or Green Beans - \$1.50",
        "Waffle Fries - \$1.50",
        "Corn Muffin - \$1.00",
        "Garden or Caesar Salad - \$4.25",
        "Coke Products (Cans or Water) - \$1.25",
      ],
    },
    "Buckstop": {
  "Breakfast": [
    "Sausage, Egg, and Cheese Bagel - \$3.00",
    "Bacon, Egg, and Cheese Bagel - \$3.00",
    "Egg and Cheese Bagel - \$2.50",
    "Bagel - \$1.50",
    "Sausage, Egg, and Cheese Biscuit - \$2.75",
    "Bacon, Egg, and Cheese Biscuit - \$2.75",
    "Egg and Cheese Biscuit - \$2.25",
    "Biscuit - \$1.25",
    "Muffins - \$2.50",
    "Breakfast Pizza Slice - \$2.75",
  ],
  "Lunch": [
    "Hamburger - \$3.50",
    "Cheeseburger - \$3.75",
    "Double Burger - \$5.50",
    "Double Cheese Burger - \$6.00",
    "Grilled Chicken - \$4.25",
    "All Beef Hot Dogs - \$2.75",
    "Mahi Mahi - \$5.00",
    "Italian Sausage - \$3.50",
    "Black Bean Burger - \$3.75",
  ],
  "Whole Pizza": [
    "Cheese - \$15.00",
    "Pepperoni - \$17.00",
    "Vegetarian - \$18.00",
    "Meat Lovers - \$19.00",
    "Supreme - \$20.00",
    "Daily Special - \$18.00",
    "Whole Flatbread (Cheese, Pepp, Supreme, Veggie) - \$12.00",
    "Half Flatbread (Cheese, Pepp, Supreme, Veggie) - \$6.00",
    "Add Extra Toppings - \$1.50",
  ],
  "By The Slice": [
    "Cheese - \$2.00",
    "Pepperoni - \$2.75",
    "Vegetarian - \$3.25",
    "Meat Lovers - \$3.25",
    "Supreme - \$3.50",
    "Daily Special - \$3.25",
    "Flatbread (Cheese, Pepp, Supreme, Veggie) - \$1.75",
  ],
  "Sides And Extras": [
    "Regular Combo (Chips & Can Soda or Water) - \$2.00",
    "Specialty Combo (Grilled Veggies & Can Soda or Water) - \$2.50",
    "Grilled Veggies - \$1.50",
    "Bag of Chips - \$1.25",
  ],
  "Beverages": [
    "Water Bottle - \$1.25",
    "12oz Can of Soda (Coke, Diet Coke, Sprite, Barq's Root Beer, Tea) - \$1.00",
  ],
},

    "TuTu's Cyber Cafe": {
  "Coffee": [
    "Coffee of the Day (Tall) - \$2.00",
    "Coffee of the Day (Grande) - \$2.20",
    "Coffee of the Day (Venti) - \$2.50",
    "Decaf Coffee (Tall) - \$2.00",
    "Decaf Coffee (Grande) - \$2.20",
    "Decaf Coffee (Venti) - \$2.50",
  ],
  "Espresso Drinks": [
    "Caffe Latte (Tall) - \$3.20",
    "Caffe Latte (Grande) - \$3.90",
    "Caffe Latte (Venti) - \$4.20",
    "Caffe Mocha (Tall) - \$3.50",
    "Caffe Mocha (Grande) - \$4.40",
    "Caffe Mocha (Venti) - \$4.70",
    "Carmel Macchiato (Tall) - \$3.80",
    "Carmel Macchiato (Grande) - \$4.60",
    "Carmel Macchiato (Venti) - \$5.00",
    "Cappuccino (Tall) - \$3.20",
    "Cappuccino (Grande) - \$3.75",
    "Cappuccino (Venti) - \$4.00",
    "White Chocolate Mocha (Tall) - \$4.00",
    "White Chocolate Mocha (Grande) - \$4.50",
    "White Chocolate Mocha (Venti) - \$4.75",
    "Caffe Americano (Tall) - \$2.50",
    "Caffe Americano (Grande) - \$2.75",
    "Caffe Americano (Venti) - \$3.00",
  ],
  "Iced Drinks": [
    "Iced Caffe Latte (Tall) - \$3.20",
    "Iced Caffe Latte (Grande) - \$3.90",
    "Iced Caffe Latte (Venti) - \$4.20",
    "Iced Caffe Mocha (Tall) - \$3.50",
    "Iced Caffe Mocha (Grande) - \$4.40",
    "Iced Caffe Mocha (Venti) - \$4.70",
    "Iced Caramel Macchiato (Tall) - \$3.80",
    "Iced Caramel Macchiato (Grande) - \$4.60",
    "Iced Caramel Macchiato (Venti) - \$5.00",
    "Iced Chai Latte (Tall) - \$3.85",
    "Iced Chai Latte (Grande) - \$4.60",
    "Iced Chai Latte (Venti) - \$5.00",
    "Iced White Chocolate Mocha (Tall) - \$4.00",
    "Iced White Chocolate Mocha (Grande) - \$4.50",
    "Iced White Chocolate Mocha (Venti) - \$4.75",
    "Iced Coffee (Tall) - \$2.20",
    "Iced Coffee (Grande) - \$2.70",
    "Iced Coffee (Venti) - \$3.20",
  ],
  "Frappuccinos": [
    "Mocha (Grande) - \$4.75",
    "Coffee (Grande) - \$4.75",
    "Caramel (Grande) - \$4.75",
    "Strawberries 'n Cream (Grande) - \$4.75",
    "Vanilla Bean (Grande) - \$4.75",
    "Java Chip (Grande) - \$4.75",
    "Double Chocolate Chip (Grande) - \$4.75",
  ],
  "Alternatives": [
    "Hot Tea (Tall) - \$1.70",
    "Hot Tea (Grande) - \$2.00",
    "Hot Tea (Venti) - \$2.25",
    "Iced Tea (Tall) - \$1.75",
    "Iced Tea (Grande) - \$2.20",
    "Iced Tea (Venti) - \$2.70",
    "Chai Latte (Tall) - \$3.85",
    "Chai Latte (Grande) - \$4.10",
    "Chai Latte (Venti) - \$4.35",
    "Hot Chocolate (Tall) - \$3.00",
    "Hot Chocolate (Grande) - \$3.50",
    "Hot Chocolate (Venti) - \$3.70",
    "Caffe Americano (Tall) - \$2.50",
    "Caffe Americano (Grande) - \$2.75",
    "Caffe Americano (Venti) - \$3.00",
    "Creamice (Grande) - \$4.50",
    "Creamice (Venti) - \$4.75",
  ],
  "Extras": [
    "Single Espresso - \$2.00",
    "Double Espresso - \$2.20",
    "Extra Shot - \$0.75",
    "Add Flavor Syrup - \$0.75",
  ],
},

 "Grillmaster": {
      "Appetizers": [
        "Mozzarella Sticks - \$5.99",
        "Onion Rings - \$4.99",
        "Jalapeno Poppers - \$6.99",
        "Chicken Tenders - \$7.99",
        "Fried Pickles - \$4.99",
        "Fried Green Tomatoes - \$5.99",
        "Fried Mushrooms - \$5.99",
      ],
      "Burgers": [
        "Classic Burger - \$8.99",
        "Bacon Cheeseburger - \$9.99",
        "Mushroom Swiss Burger - \$9.99",
        "BBQ Burger - \$10.99",
        "Turkey Burger - \$8.99",
        "Veggie Burger - \$8.99",
      ],
      "Sandwiches": [
        "Grilled Chicken Sandwich - \$9.99",
        "Philly Cheesesteak - \$11.99",
        "Club Sandwich - \$10.99",
        "Fish Sandwich - \$9.99",
        "BLT Sandwich - \$8.99",
      ],
      "Salads": [
        "House Salad - \$7.99",
        "Caesar Salad - \$8.99",
        "Grilled Chicken Salad - \$10.99",
        "Chef Salad - \$9.99",
        "Cobb Salad - \$10.99",
      ],
      "Sides": [
        "French Fries - \$2.99",
        "Sweet Potato Fries - \$3.99",
        "Onion Rings - \$3.99",
        "Cole Slaw - \$2.99",
        "Side Salad - \$3.99",
        "Mashed Potatoes - \$3.99",
      ],
    },
    "Steak 'n Shake": {
      "Classic Milkshakes": [
        "Vanilla - \$3.99",
        "Chocolate - \$3.99",
        "Strawberry - \$3.99",
        "Banana - \$3.99",
        "Hot Fudge - \$4.29",
        "Cookie Dough - \$4.29",
        "Mocha - \$4.29",
      ],
      "Burgers": [
        "Classic Steakburger - \$4.99",
        "Bacon 'n Cheese Steakburger - \$5.99",
        "Jalapeno Crunch Steakburger - \$5.99",
        "Garlic Double Steakburger - \$6.99",
        "Portobello 'n Swiss Steakburger - \$6.99",
      ],
      "Sandwiches": [
        "Grilled Cheese - \$3.99",
        "BLT - \$4.99",
        "Grilled Chicken Sandwich - \$5.99",
        "Spicy Chicken Sandwich - \$5.99",
        "Philly Steakburger - \$6.99",
      ],
      "Breakfast": [
        "Pancakes - \$4.99",
        "French Toast - \$4.99",
        "Sausage and Egg Biscuit - \$3.99",
        "Bacon and Egg Biscuit - \$3.99",
        "Sausage Gravy and Biscuits - \$4.99",
      ],
      "Sides": [
        "French Fries - \$1.99",
        "Onion Rings - \$2.49",
        "Chili Cheese Fries - \$2.99",
        "Chili Cheese Nachos - \$3.99",
        "Applesauce - \$1.49",
      ],
    },
    "Healthy Blend Deli": {
      "Wraps": [
        "Veggie Wrap - \$6.99",
        "Chicken Caesar Wrap - \$7.99",
        "Turkey Club Wrap - \$8.99",
        "Grilled Veggie Wrap - \$6.99",
        "California Turkey Wrap - \$8.99",
      ],
      "Sandwiches": [
        "Turkey Sandwich - \$7.99",
        "Roast Beef Sandwich - \$8.99",
        "Chicken Salad Sandwich - \$7.99",
        "Veggie Delight Sandwich - \$6.99",
        "Tuna Salad Sandwich - \$7.99",
      ],
      "Salads": [
        "Garden Salad - \$5.99",
        "Caesar Salad - \$6.99",
        "Greek Salad - \$7.99",
        "Chef Salad - \$8.99",
        "Cobb Salad - \$8.99",
      ],
      "Sides": [
        "Fruit Cup - \$2.99",
        "Side Salad - \$3.99",
        "Chips - \$1.49",
        "Cole Slaw - \$1.99",
        "Pasta Salad - \$2.49",
      ],
      "Smoothies": [
        "Strawberry Banana - \$4.99",
        "Mango Madness - \$4.99",
        "Berry Blast - \$4.99",
        "Peach Perfection - \$4.99",
        "Green Machine - \$4.99",
      ],
    },
    "Wynee's Bistro": {
      // Define menu for Wynee's Bistro
      "Implement website scraping here": [
              "food thingy",
            ],
        },
      };

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
                children: _buildMenuList(_menus[location] ?? {}),
              ),
              SizedBox(height: 40), // Add space between ExpansionTiles
            ],
          );
        },
      ),
    ),
  );
}


  List<Widget> _buildMenuList(Map<String, List<dynamic>> menu) {
    List<Widget> menuItems = [];
    menu.forEach((category, items) {
    menuItems.add(
      Container(
        color: Colors.black, // Set background color to black
        child: ListTile(
          title: Text(
            category,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
      ),
    );
      items.forEach((item) {
        menuItems.add(
          ListTile(
            title: Text(item,
            style: TextStyle(color: Colors.white),),
          ),
        );
      });
    });
    return menuItems;
  }
}
