import 'dart:async'; 
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Meals(),
    );
  }
}

class Meals extends StatefulWidget {
  const Meals({super.key});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  // This is your dummy data to represent meals from an API
  final List<String> meals = [
    "Spaghetti Carbonara",
    "Vegetarian Pizza",
    "Classic Cheeseburger",
    "Chicken Salad",
    "Vegan Sushi",
    // Add more if needed
  ];
  bool _isLoading = false;

  
  Future<void> _orderMeal(String meal) async {
    if (!_isLoading) { // Prevent multiple orders from being placed simultaneously
      setState(() {
        _isLoading = true; // Set the flag to show a loading indicator
      });

      print('Placing order for: $meal');

      // Simulate a network request to place an order
      await Future.delayed(const Duration(seconds: 2), () {
        print('Order placed for: $meal');
      });

      setState(() {
        _isLoading = false; // Clear the flag to hide the loading indicator
      });

      // Here, you'd also want to provide the user with some feedback that their order was successful
    }
  }

  // This function simulates placing an order when the 'Order' button is clicked
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 144, 20),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu),
        color: Colors.black,
        )
        
        ],
        backgroundColor: Color.fromARGB(255, 186, 144, 20),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 30),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromARGB(255, 205, 202, 202),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 138, 131, 131),
                  offset: Offset(0, 4),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for a meal...',
                border: InputBorder.none,
              ),
            ),
          ),
           if (_isLoading) 
            const CircularProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias, // This is essential to make sure the image corners are also rounded
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Card corner radius
                  ),
                   margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Text(meals[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    ),
                    trailing:ElevatedButton(
  onPressed: () => _orderMeal(meals[index]),
  child: Text('Order Meal Here'),
  style: ElevatedButton.styleFrom(
    primary: Color.fromARGB(255, 3, 18, 13), // This is the primary color of the button (the background color)
    onPrimary: Colors.white, // This is the color of the text (and other foreground content)
    onSurface: const Color.fromARGB(255, 165, 47, 47), // This is the color used for the "disabled" state
  ),
),

                  ),
                );
              },
            ),
          ),
         
        ],
      ),
    );
  }
}

