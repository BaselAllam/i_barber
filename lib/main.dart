import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_screens/bottom_nav_bar.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar()
    );
  }
}

/*

  Session Topics=>
    1- BottomNavBar
    2- SetState
    3- Navigation
    4- Buttons ( IconButton, TextButton, FAB )

*/