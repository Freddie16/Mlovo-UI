import 'package:flutter/material.dart';
import 'package:meals_app/meals.dart';

void main() {
  runApp(DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Meals(),
    );
  }
}